#pragma once

#include "../OutputFormat.h"
#include "../InfoWriterSettings.h"
#include <string>
#include <cstdint>

class OutputFormatUserInput : public IOutputFormat {
private:
    const InfoWriterSettings &settings;
    const std::string currentFilename;
    
    // 将秒数转换为时分秒毫秒格式的字符串 (00:00:00:000)
    std::string SecsToHMSMSString(const int64_t totalseconds, const int milliseconds) const;
    
    // 写入字符串到文件
    void WriteGFStringToFile(const std::string filename, const std::string text) const;
    
    // 写入CSV格式的行
    void WriteCSVLine(const int64_t timestamp, const std::string event_type, const std::string event_details) const;

public:
    OutputFormatUserInput(const InfoWriterSettings &settings, const std::string filename);
    virtual ~OutputFormatUserInput() = default;
    
    virtual void Start() override;
    virtual void Stop(const int64_t timestamp) override;
    
    virtual void HotkeyMarker(const int64_t timestamp, const std::string text) override;
    virtual void ScenechangeMarker(const int64_t timestamp, const std::string scenename) override;
    virtual void PausedMarker(const int64_t timestamp) override;
    virtual void ResumedMarker(const int64_t timestamp, const int64_t pauselength) override;
    
    virtual void TextMarker(const std::string text) override;
    
    // 记录用户输入事件
    void LogUserInputEvent(const int64_t timestamp, const std::string event_type, const std::string event_details);
}; 