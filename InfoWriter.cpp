#include "InfoWriter.h"

#include <obs-frontend-api.h>
#include <Groundfloor/Atoms/Defines.h>
#include <Groundfloor/Materials/Functions.h>
#include <cstdint>
#include <cmath>
#include <memory>
#include <regex>
#include <chrono>
#include <iomanip>
#include <sstream>

#include "OutputFormat/OutputFormat.Default.h"
#include "OutputFormat/OutputFormat.EDL.h"
#include "OutputFormat/OutputFormat.CSV.h"
#include "OutputFormat/OutputFormat.SRT.h"
#include "OutputFormat/OutputFormat.UserInput.h"

InfoWriter* g_infoWriter = nullptr;

const char *c_TimestampNotation = "%Y-%m-%d %H:%M:%S";

InfoWriter::InfoWriter() : Settings()
{
	lastInfoMediaType = imtUnknown;
	StartTime = 0;
	StartRecordTime = 0;
	StartStreamTime = 0;
	PausedTotalTime = 0;
	PausedStartTime = 0;
	StreamStarted = false;
	RecordStarted = false;
	Paused = false;
}

std::string InfoWriter::SecsToHMSString(const int64_t totalseconds) const
{
	uint32_t hr = (uint32_t)trunc(totalseconds / 60.0 / 60.0);
	uint32_t min = (uint32_t)trunc(totalseconds / 60.0) - (hr * 60);
	uint32_t sec = totalseconds % 60;

	// 获取当前时间的毫秒部分
	auto now = std::chrono::system_clock::now();
	auto now_ms = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count() % 1000;

	std::string format = Settings.GetFormat();
	std::string replacement = "\t";
	std::regex tabregex("(\\\\t)");
	format = std::regex_replace(format, tabregex, replacement);
	format += "\0\0\0\0";

	char buffer[1024];
	sprintf(&buffer[0], format.c_str(), hr, min, sec);

	// 添加毫秒信息
	std::stringstream ss;
	ss << buffer << ":" << std::setfill('0') << std::setw(3) << now_ms;

	return ss.str();
}

std::string InfoWriter::SecsToHMSString(const int64_t totalseconds, const int milliseconds) const
{
	uint32_t hr = (uint32_t)trunc(totalseconds / 60.0 / 60.0);
	uint32_t min = (uint32_t)trunc(totalseconds / 60.0) - (hr * 60);
	uint32_t sec = totalseconds % 60;

	std::string format = Settings.GetFormat();
	std::string replacement = "\t";
	std::regex tabregex("(\\\\t)");
	format = std::regex_replace(format, tabregex, replacement);
	format += "\0\0\0\0";

	char buffer[1024];
	sprintf(&buffer[0], format.c_str(), hr, min, sec);

	// 添加毫秒信息
	std::stringstream ss;
	ss << buffer << ":" << std::setfill('0') << std::setw(3) << milliseconds;

	return ss.str();
}

int64_t InfoWriter::getPausedTime(const int64_t currentTime) const
{
	auto PausedTmpTime = PausedTotalTime;

	if (Paused) {
		PausedTmpTime =
			PausedTotalTime + (currentTime - PausedStartTime);
	}

	return PausedTmpTime;
}

void InfoWriter::WriteInfo(const std::string AExtraInfo) const
{
	if (output == nullptr)
		return;

	char crlf[] = GFNATIVENEXTLINE;

	std::string Info;
	auto currentTime = Groundfloor::GetTimestamp();
	auto tmpTime = SecsToHMSString(0);

	auto PausedTmpTime = getPausedTime(currentTime);

	if (RecordStarted) {
		tmpTime = SecsToHMSString((currentTime - StartRecordTime) -
					  PausedTmpTime);
	}

	std::string record_info = tmpTime;
	tmpTime = SecsToHMSString(0);
	if (StreamStarted) {
		tmpTime = SecsToHMSString(currentTime - StartStreamTime);
	}
	auto stream_info = tmpTime;

	record_info += " Record Time Marker";
	stream_info += " Stream Time Marker";

	if (!RecordStarted)
		record_info += " (not recording)";
	if (Paused)
		record_info += " (recording is paused)";
	if (!StreamStarted)
		stream_info += " (not streaming)";

	record_info += crlf;
	stream_info += crlf;

	if (AExtraInfo.length() != 0) {
		Info = "";
		Info += AExtraInfo;
		Info += crlf;
	}

	Info += record_info;
	if (this->Settings.GetShouldLogStreaming())
		Info += stream_info;

	output->TextMarker(Info);
}

void InfoWriter::WriteInfo(const InfoHotkey AHotkey) const
{
	if (output == nullptr)
		return;

	auto Now = Groundfloor::GetTimestamp();
	auto hotkey_text = Settings.GetHotkeyText(AHotkey);

	if (lastInfoMediaType == imtStream) {
		output->HotkeyMarker(Now - StartStreamTime, hotkey_text);
	} else {
		output->HotkeyMarker(Now - StartRecordTime - getPausedTime(Now),
				     hotkey_text);
	}

	this->WriteInfo("");
}

void InfoWriter::WriteSceneChange(const std::string scenename) const
{
	if (output == nullptr)
		return;

	auto Now = Groundfloor::GetTimestamp();

	if (lastInfoMediaType == imtStream) {
		if (scenename == "") {
			output->ScenechangeMarker(Now - StartStreamTime,
						  "UNKNO");
		} else {
			output->ScenechangeMarker(Now - StartStreamTime,
						  scenename);
		}
	} else {
		if (scenename == "") {
			output->ScenechangeMarker(Now - StartRecordTime -
							  getPausedTime(Now),
						  "UNKNO");
		} else {
			output->ScenechangeMarker(Now - StartRecordTime -
							  getPausedTime(Now),
						  scenename);
		}
	}

	this->WriteInfo("");
}

void InfoWriter::InitCurrentFilename(int64_t timestamp)
{
	bool currentname_set = false;

	if (Settings.GetShouldSyncNameAndPathWithVideo()) {
		obs_output_t *output = obs_frontend_get_recording_output();
		if (output) {
			obs_data_t *outputSettings =
				obs_output_get_settings(output);

			obs_data_item_t *item =
				obs_data_item_byname(outputSettings, "url");
			if (!item) {
				item = obs_data_item_byname(outputSettings,
							    "path");
			}

			if (item) {
				CurrentFilename =
					obs_data_item_get_string(item);
				size_t videoextensionstart =
					CurrentFilename.find_last_of('.') + 1;
				CurrentFilename.replace(
					videoextensionstart,
					CurrentFilename.length(),
					Settings.GetAutomaticOutputExtension()
						.c_str());
				currentname_set = true;
			}
		}
	}

	if (!currentname_set) {
		CurrentFilename = Settings.GetFilename();
		if (CurrentFilename.find('%') != 0) {
			auto filename = Groundfloor::TimestampToStr(
				CurrentFilename.c_str(), StartTime);
			CurrentFilename = filename->getValue();
			delete filename;
		}
	}
}

void InfoWriter::MarkStart(InfoMediaType AType)
{
	StartTime = Groundfloor::GetTimestamp();
	InitCurrentFilename(StartTime);

	auto outputformat = Settings.GetOutputFormat();
	if (outputformat == "csv") {
		output = std::make_unique<OutputFormatCSV>(Settings,
							   CurrentFilename);
	} else if (outputformat == "edl") {
		output = std::make_unique<OutputFormatEDL>(Settings,
							   CurrentFilename);
	} else if (outputformat == "srt") {
		output = std::make_unique<OutputFormatSRT>(Settings,
							   CurrentFilename);
	} else if (outputformat == "userinput") {
		output = std::make_unique<OutputFormatUserInput>(Settings,
							   CurrentFilename);
	} else {
		output = std::make_unique<OutputFormatDefault>(Settings,
							       CurrentFilename);
	}

	output->Start();

	auto MarkStr =
		Groundfloor::TimestampToStr(c_TimestampNotation, StartTime);

	lastInfoMediaType = AType;

	switch (AType) {
	case imtStream:
		StartStreamTime = StartTime;
		StreamStarted = true;
		if (this->Settings.GetShouldLogStreaming()) {
			MarkStr->prepend_ansi("EVENT:START STREAM @ ");
		}
		output->TextMarker(MarkStr->getValue());
		break;
	case imtUnknown:
		MarkStr->prepend_ansi(" (WARNING:Unsure how we STARTED) ");
		break;
	case imtRecording:
		MarkStr->prepend_ansi("EVENT:START RECORDING @ ");
		StartRecordTime = StartTime;
		RecordStarted = true;
		Paused = false;
		output->TextMarker(MarkStr->getValue());
		break;
	case imtRecordingPauseStart:
		break;
	case imtRecordingPauseResume:
		break;
	}

	delete MarkStr;

	this->WriteInfo("");
}

void InfoWriter::MarkStop(InfoMediaType AType)
{
	if (output == nullptr)
		return;

	auto Now = Groundfloor::GetTimestamp();
	auto MarkStr = Groundfloor::TimestampToStr(c_TimestampNotation, Now);

	switch (AType) {
	case imtStream:
		output->Stop(Now - StartStreamTime);
		MarkStr->prepend_ansi("EVENT:STOP STREAM @ ");
		MarkStr->append(" Stream Time Marker Reset to 0");
		StreamStarted = false;
		StartStreamTime = 0;
		break;
	case imtUnknown:
	case imtRecording:
		output->Stop(Now - StartRecordTime - getPausedTime(Now));
		MarkStr->prepend_ansi("EVENT:STOP RECORDING @ ");
		MarkStr->append(" Record Time Marker Reset to 0");
		StartRecordTime = 0; //reset times
		PausedTotalTime = 0;
		Paused = false;
		RecordStarted = false;
		break;
	case imtRecordingPauseStart:
		break;
	case imtRecordingPauseResume:
		break;
	}

	WriteInfo(MarkStr->getValue());

	delete MarkStr;
}

void InfoWriter::MarkPauseStart(const InfoMediaType AType)
{
	if (output == nullptr)
		return;

	Paused = true;
	PausedStartTime = Groundfloor::GetTimestamp();

	output->PausedMarker(PausedStartTime - StartTime);
	this->WriteInfo("");
}

void InfoWriter::MarkPauseResume(const InfoMediaType AType)
{
	if (output == nullptr)
		return;

	Paused = false;
	auto CurrentTime = Groundfloor::GetTimestamp();
	PausedTotalTime += (CurrentTime - PausedStartTime);

	output->ResumedMarker(CurrentTime - StartTime,
			      CurrentTime - PausedStartTime);
	this->WriteInfo("");
}

bool InfoWriter::HasStarted() const
{
	if (StreamStarted)
		return true;
	if (RecordStarted)
		return true;
	return false;
}

bool InfoWriter::IsStreaming() const
{
	return StreamStarted;
}

std::string InfoWriter::NowTimeStamp() const
{
	auto NowStr =
		Groundfloor::TimestampToStr(c_TimestampNotation, StartTime);
	return NowStr->getValue();
}

InfoWriterSettings *InfoWriter::GetSettings()
{
	return &Settings;
}

void InfoWriter::LogKeyEvent(const Event &event)
{
	if (output == nullptr)
		return;

	// 检查输出格式是否为用户输入格式
	auto outputFormat = dynamic_cast<OutputFormatUserInput*>(output.get());
	if (outputFormat) {
		// 获取当前时间
		auto Now = Groundfloor::GetTimestamp();
		int64_t timestamp;
		
		// 根据当前记录类型选择时间戳
		if (lastInfoMediaType == imtStream) {
			timestamp = Now - StartStreamTime;
		} else {
			timestamp = Now - StartRecordTime - getPausedTime(Now);
		}
		
		// 将键码转换为ASCII字符（如果可能）
		char asciiChar = (event.key.code >= 32 && event.key.code <= 126) ? 
						static_cast<char>(event.key.code) : '\0';
		std::string asciiStr = (asciiChar != '\0') ? 
						std::string(1, asciiChar) : "non-printable";
		
		// 创建包含ASCII信息的JSON
		std::string jsonWithAscii = event.toJSON();
		// 在JSON的最后一个}前插入ASCII信息
		size_t pos = jsonWithAscii.rfind('}');
		if (pos != std::string::npos) {
			jsonWithAscii.insert(pos, ", \"ascii\": \"" + asciiStr + "\"");
		}
		
		// 根据事件类型记录
		if (event.type == EVENT_KEY_PRESSED) {
			outputFormat->LogUserInputEvent(timestamp, "key_pressed", jsonWithAscii);
		} else if (event.type == EVENT_KEY_RELEASED) {
			outputFormat->LogUserInputEvent(timestamp, "key_released", jsonWithAscii);
		}
	} else {
		// 如果不是用户输入格式，则使用普通文本记录
		std::string eventInfo;
		
		// 将键码转换为ASCII字符（如果可能）
		char asciiChar = (event.key.code >= 32 && event.key.code <= 126) ? 
						static_cast<char>(event.key.code) : '\0';
		std::string asciiStr = (asciiChar != '\0') ? 
						std::string(1, asciiChar) : "non-printable";
		
		if (event.type == EVENT_KEY_PRESSED) {
			eventInfo = "Key pressed: code=" + std::to_string(event.key.code) + 
						", rawcode=" + std::to_string(event.key.rawcode) +
						", ascii='" + asciiStr + "'";
		} else if (event.type == EVENT_KEY_RELEASED) {
			eventInfo = "Key released: code=" + std::to_string(event.key.code) + 
						", rawcode=" + std::to_string(event.key.rawcode) +
						", ascii='" + asciiStr + "'";
		}
		
		if (!eventInfo.empty()) {
			WriteInfo(eventInfo);
		}
	}
}

void InfoWriter::LogMouseEvent(const Event &event)
{
	if (output == nullptr)
		return;

	// 检查输出格式是否为用户输入格式
	auto outputFormat = dynamic_cast<OutputFormatUserInput*>(output.get());
	if (outputFormat) {
		// 获取当前时间
		auto Now = Groundfloor::GetTimestamp();
		int64_t timestamp;
		
		// 根据当前记录类型选择时间戳
		if (lastInfoMediaType == imtStream) {
			timestamp = Now - StartStreamTime;
		} else {
			timestamp = Now - StartRecordTime - getPausedTime(Now);
		}
		
		// 根据事件类型记录
		if (event.type == EVENT_MOUSE_PRESSED) {
			outputFormat->LogUserInputEvent(timestamp, "mouse_pressed", event.toJSON());
		} else if (event.type == EVENT_MOUSE_RELEASED) {
			outputFormat->LogUserInputEvent(timestamp, "mouse_released", event.toJSON());
		} else if (event.type == EVENT_MOUSE_MOVED) {
			outputFormat->LogUserInputEvent(timestamp, "mouse_moved", event.toJSON());
		}
	} else {
		// 如果不是用户输入格式，则使用普通文本记录
		std::string eventInfo;
		if (event.type == EVENT_MOUSE_PRESSED) {
			eventInfo = "Mouse pressed: x=" + std::to_string(event.mouse.x) + 
						", y=" + std::to_string(event.mouse.y) + 
						", button=" + std::to_string(event.mouse.button);
		} else if (event.type == EVENT_MOUSE_RELEASED) {
			eventInfo = "Mouse released: x=" + std::to_string(event.mouse.x) + 
						", y=" + std::to_string(event.mouse.y) + 
						", button=" + std::to_string(event.mouse.button);
		} else if (event.type == EVENT_MOUSE_MOVED) {
			eventInfo = "Mouse moved: x=" + std::to_string(event.mouse.x) + 
						", y=" + std::to_string(event.mouse.y);
		}
		
		if (!eventInfo.empty()) {
			WriteInfo(eventInfo);
		}
	}
}
