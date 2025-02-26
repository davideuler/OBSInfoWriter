#pragma once
#include <string>
#include <cstdint>
#include <sstream>

// 事件类型枚举
enum EventType : uint8_t {
    EVENT_KEY_PRESSED = 0,
    EVENT_KEY_RELEASED,
    EVENT_MOUSE_PRESSED,
    EVENT_MOUSE_RELEASED,
    EVENT_MOUSE_MOVED,
    EVENT_UNKNOWN
};

// 键盘事件数据
struct KeyEvent {
    int code = 0;
    int mask = 0;
    int rawcode = 0;
};

// 鼠标事件数据
struct MouseEvent {
    int x = 0;
    int y = 0;
    int button = 0;
};

// 通用事件结构
struct Event {
    EventType type;
    int64_t time;      // 时间戳
    union {
        KeyEvent key;
        MouseEvent mouse;
    };
    
    Event() : type(EVENT_UNKNOWN), time(0), key{0, 0, 0} {} // 正确的初始化方式

    // 转换为JSON字符串的方法
    std::string toJSON() const {
        std::stringstream ss;
        ss << "{ \"event_type\": \"";
        
        switch(type) {
            case EVENT_KEY_PRESSED:
                ss << "key_pressed\", "
                   << "\"keycode\": " << key.code
                   << ", \"mask\": " << key.mask
                   << ", \"rawcode\": " << key.rawcode;
                break;
            case EVENT_KEY_RELEASED:
                ss << "key_released\", "
                   << "\"keycode\": " << key.code
                   << ", \"mask\": " << key.mask
                   << ", \"rawcode\": " << key.rawcode;
                break;
            case EVENT_MOUSE_PRESSED:
                ss << "mouse_pressed\", "
                   << "\"x\": " << mouse.x
                   << ", \"y\": " << mouse.y
                   << ", \"button\": " << mouse.button;
                break;
            case EVENT_MOUSE_RELEASED:
                ss << "mouse_released\", "
                   << "\"x\": " << mouse.x
                   << ", \"y\": " << mouse.y
                   << ", \"button\": " << mouse.button;
                break;
            case EVENT_MOUSE_MOVED:
                ss << "mouse_moved\", "
                   << "\"x\": " << mouse.x
                   << ", \"y\": " << mouse.y;
                break;
            case EVENT_UNKNOWN:
            default:
                ss << "unknown\"";
                break;
        }
        
        ss << ", \"time\": " << time << "}";
        return ss.str();
    }
}; 