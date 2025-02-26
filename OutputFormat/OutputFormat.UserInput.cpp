#include "OutputFormat.UserInput.h"
#include <Groundfloor/Materials/FileWriter.h>
#include <regex>
#include <cmath>
#include <iomanip>
#include <sstream>
#include <chrono>

OutputFormatUserInput::OutputFormatUserInput(const InfoWriterSettings &settings,
                                       const std::string filename)
    : IOutputFormat(), settings(settings), currentFilename(filename)
{
}

std::string OutputFormatUserInput::SecsToHMSMSString(const int64_t totalseconds, const int milliseconds) const
{
    uint32_t hr = (uint32_t)trunc(totalseconds / 60.0 / 60.0);
    uint32_t min = (uint32_t)trunc(totalseconds / 60.0) - (hr * 60);
    uint32_t sec = totalseconds % 60;
    
    std::stringstream ss;
    ss << std::setfill('0') << std::setw(2) << hr << ":"
       << std::setfill('0') << std::setw(2) << min << ":"
       << std::setfill('0') << std::setw(2) << sec << ":"
       << std::setfill('0') << std::setw(3) << milliseconds;
    
    return ss.str();
}

void OutputFormatUserInput::WriteGFStringToFile(const std::string filename,
                                          const std::string text) const
{
    Groundfloor::String line(text);
    
    Groundfloor::FileWriter Writer;
    Writer.open(filename.c_str(), true);
    Writer.start();
    Writer.add(&line);
    
    while (!Writer.isEmpty()) {
        GFMillisleep(10);
    }
    
    Writer.stopAndWait();
    Writer.close();
}

void OutputFormatUserInput::Start()
{
    // 写入CSV头部
    std::string header = "current_time,timestamp,event_type,event_details\n";
    WriteGFStringToFile(currentFilename, header);
}

void OutputFormatUserInput::Stop(const int64_t timestamp)
{
    // 可以在这里添加停止记录的逻辑
}

void OutputFormatUserInput::WriteCSVLine(const int64_t timestamp, 
                                    const std::string event_type,
                                    const std::string event_details) const
{
    char crlf[] = GFNATIVENEXTLINE;
    
    // 获取当前时间的毫秒部分
    auto now = std::chrono::system_clock::now();
    auto now_ms = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count() % 1000;
    
    // 计算实际时间戳的毫秒部分
    int timestamp_ms = now_ms; // 使用当前时间的毫秒部分
    
    // 格式化当前时间为 00:00:00:000 格式
    auto formattedTime = SecsToHMSMSString(timestamp, timestamp_ms);
    
    // 获取当前时间戳（毫秒级）
    auto current_timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(
        now.time_since_epoch()
    ).count();
    
    // 构建CSV行
    std::string line = formattedTime + "," + 
                      std::to_string(current_timestamp) + "," + 
                      event_type + "," + 
                      "\"" + event_details + "\"" + 
                      crlf;
    
    WriteGFStringToFile(currentFilename, line);
}

void OutputFormatUserInput::HotkeyMarker(const int64_t timestamp,
                                    const std::string text)
{
    // 将热键事件记录为用户输入
    WriteCSVLine(timestamp, "hotkey_pressed", "{ \"event_type\": \"hotkey_pressed\", \"hotkey\": \"" + text + "\", \"time\": " + std::to_string(timestamp) + "}");
}

void OutputFormatUserInput::ScenechangeMarker(const int64_t timestamp,
                                         const std::string scenename)
{
    // 将场景变化记录为事件
    WriteCSVLine(timestamp, "scene_changed", "{ \"event_type\": \"scene_changed\", \"scene\": \"" + scenename + "\", \"time\": " + std::to_string(timestamp) + "}");
}

void OutputFormatUserInput::PausedMarker(const int64_t timestamp)
{
    // 记录暂停事件
    WriteCSVLine(timestamp, "recording_paused", "{ \"event_type\": \"recording_paused\", \"time\": " + std::to_string(timestamp) + "}");
}

void OutputFormatUserInput::ResumedMarker(const int64_t timestamp,
                                     const int64_t pauselength)
{
    // 记录恢复事件
    WriteCSVLine(timestamp, "recording_resumed", "{ \"event_type\": \"recording_resumed\", \"pause_length\": " + std::to_string(pauselength) + ", \"time\": " + std::to_string(timestamp) + "}");
}

void OutputFormatUserInput::TextMarker(const std::string text)
{
    // 对于普通文本标记，我们可以选择不记录或者以特定格式记录
    // 这里我们选择不记录，因为它可能会干扰用户输入日志的格式
}

void OutputFormatUserInput::LogUserInputEvent(const int64_t timestamp, 
                                         const std::string event_type, 
                                         const std::string event_details)
{
    // 直接记录用户输入事件
    WriteCSVLine(timestamp, event_type, event_details);
} 