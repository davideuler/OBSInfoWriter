// note: the external symbols are defined in obs-module.h

#include <obs-module.h>
#include <obs-frontend-api.h>
#include <Groundfloor/Materials/FileWriter.h>
#include <Groundfloor/Materials/Functions.h>
#include <Groundfloor/Atoms/Defines.h>
#include "InfoWriter.h"
#include "Event.h"
#include <obs-hotkey.h>
#include <util/platform.h>

#ifdef _WIN32
#include <windows.h>
#endif

// 在文件顶部的全局区域添加变量声明（如果它应该是全局变量）
extern InfoWriter* g_infoWriter;

const char *infowriter_idname = "Info Writer";
const char *logfile_filter = "All formats (*.*)";
const char *setting_automaticoutputextension = "automaticoutputextension";
const char *setting_file = "file";
const char *setting_format = "format";
const char *setting_syncnameandpathwithvideo = "syncnameandpathwithvideo";
const char *setting_hotkey1text = "hotkey1text";
const char *setting_hotkey2text = "hotkey2text";
const char *setting_hotkey3text = "hotkey3text";
const char *setting_hotkey4text = "hotkey4text";
const char *setting_hotkey5text = "hotkey5text";
const char *setting_hotkey6text = "hotkey6text";
const char *setting_hotkey7text = "hotkey7text";
const char *setting_hotkey8text = "hotkey8text";
const char *setting_hotkey9text = "hotkey9text";
const char *setting_hotkey10text = "hotkey10text";
const char *setting_hotkey11text = "hotkey11text";
const char *setting_hotkey12text = "hotkey12text";
const char *setting_hotkey13text = "hotkey13text";
const char *setting_hotkey14text = "hotkey14text";
const char *setting_outputformat = "outputformat";
const char *setting_shouldlogscenechanges = "logscenechanges";
const char *setting_shouldlogstreaming = "logstreaming";
const char *setting_shouldlogabsolutetime = "logabsolutetime";
const char *setting_shouldloghotkeyspecifics = "loghotkeyspecifics";

// 定义键盘按键的最大数量
#define MAX_KEYS 256

// 为每个可能的按键创建热键ID
static obs_hotkey_id key_hotkeys[MAX_KEYS];
static const char *key_names[MAX_KEYS];

// 初始化键名数组
static void init_key_names()
{
	// 初始化所有键名为NULL
	memset(key_names, 0, sizeof(key_names));
	
	// 设置常用键的名称
	key_names['A'] = "A";
	key_names['B'] = "B";
	key_names['C'] = "C";
	// ... 其他字母键 ...
	key_names['Z'] = "Z";
	
	key_names['0'] = "0";
	key_names['1'] = "1";
	// ... 其他数字键 ...
	key_names['9'] = "9";
	
	key_names[OBS_KEY_SPACE] = "Space";
	key_names[OBS_KEY_RETURN] = "Enter";
	key_names[OBS_KEY_ESCAPE] = "Escape";
	key_names[OBS_KEY_TAB] = "Tab";
	// ... 其他特殊键 ...
}

// 按键回调函数
static void key_callback(void *data, obs_hotkey_id id, obs_hotkey_t *hotkey, bool pressed)
{
	if (!pressed)
		return;
	
	InfoWriter *writer = static_cast<InfoWriter *>(data);
	if (!writer || !writer->HasStarted())
		return;
	
	// 找出是哪个键被按下
	int key_index = -1;
	for (int i = 0; i < MAX_KEYS; i++) {
		if (key_hotkeys[i] == id) {
			key_index = i;
			break;
		}
	}
	
	if (key_index >= 0) {
		const char *key_name = key_names[key_index] ? key_names[key_index] : "Unknown";
		std::string message = "Key pressed: ";
		message += key_name;
		
		// 记录按键到文件
		writer->WriteInfo(message);
	}
}

// 在插件加载时注册所有按键热键
static void register_all_key_hotkeys(InfoWriter *writer)
{
	init_key_names();
	
	// 为每个可能的键创建热键
	for (int i = 0; i < MAX_KEYS; i++) {
		if (key_names[i]) {
			std::string hotkey_name = "InfoWriter.KeyPress.";
			hotkey_name += key_names[i];
			
			std::string hotkey_desc = "Record key press: ";
			hotkey_desc += key_names[i];
			
			key_hotkeys[i] = obs_hotkey_register_frontend(
				hotkey_name.c_str(),
				hotkey_desc.c_str(),
				key_callback,
				writer);
		}
	}
}

// 在插件卸载时注销所有热键
static void unregister_all_key_hotkeys()
{
	for (int i = 0; i < MAX_KEYS; i++) {
		if (key_hotkeys[i]) {
			obs_hotkey_unregister(key_hotkeys[i]);
			key_hotkeys[i] = OBS_INVALID_HOTKEY_ID;
		}
	}
}

#ifdef _WIN32
// 全局钩子句柄
static HHOOK keyboard_hook = NULL;
static HHOOK mouse_hook = NULL;
static InfoWriter *global_writer = NULL;

// 前向声明
static void install_global_mouse_hook();
static void uninstall_global_mouse_hook();

// 键盘钩子回调
LRESULT CALLBACK KeyboardProc(int nCode, WPARAM wParam, LPARAM lParam)
{
	if (nCode >= 0 && global_writer && global_writer->HasStarted()) {
		KBDLLHOOKSTRUCT *kbStruct = (KBDLLHOOKSTRUCT*)lParam;
		DWORD vkCode = kbStruct->vkCode;
		
		// 创建事件对象
		Event event;
		event.time = Groundfloor::GetTimestamp();
		
		// 获取按键的ASCII码
		BYTE keyState[256] = {0};
		GetKeyboardState(keyState);
		
		// 设置Shift键状态
		keyState[VK_SHIFT] = (GetKeyState(VK_SHIFT) & 0x8000) ? 0x80 : 0;
		keyState[VK_CAPITAL] = (GetKeyState(VK_CAPITAL) & 0x0001) ? 0x01 : 0;
		
		// 转换虚拟键码为ASCII
		WORD ascii = 0;
		UINT scanCode = kbStruct->scanCode;
		ToAscii(vkCode, scanCode, keyState, &ascii, 0);
		
		std::string message;
		
		if (wParam == WM_KEYDOWN || wParam == WM_SYSKEYDOWN) {
			event.type = EVENT_KEY_PRESSED;
			event.key.code = ascii ? ascii : vkCode; // 使用ASCII码（如果有）
			event.key.mask = 0; // 可以添加修饰键检测
			event.key.rawcode = kbStruct->scanCode;
			
			// 记录按键到文件
			global_writer->LogKeyEvent(event);
		}
		else if (wParam == WM_KEYUP || wParam == WM_SYSKEYUP) {
			event.type = EVENT_KEY_RELEASED;
			event.key.code = ascii ? ascii : vkCode; // 使用ASCII码（如果有）
			event.key.mask = 0; // 可以添加修饰键检测
			event.key.rawcode = kbStruct->scanCode;
			
			// 记录按键释放到文件
			global_writer->LogKeyEvent(event);
		}
	}
	
	// 调用下一个钩子
	return CallNextHookEx(keyboard_hook, nCode, wParam, lParam);
}

// 鼠标钩子回调
LRESULT CALLBACK MouseProc(int nCode, WPARAM wParam, LPARAM lParam)
{
	if (nCode >= 0 && global_writer && global_writer->HasStarted()) {
		MSLLHOOKSTRUCT *mouseStruct = (MSLLHOOKSTRUCT*)lParam;
		
		// 创建事件对象
		Event event;
		event.time = Groundfloor::GetTimestamp();
		
		switch (wParam) {
			case WM_LBUTTONDOWN:
				event.type = EVENT_MOUSE_PRESSED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 1; // 左键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_LBUTTONUP:
				event.type = EVENT_MOUSE_RELEASED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 1; // 左键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_RBUTTONDOWN:
				event.type = EVENT_MOUSE_PRESSED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 2; // 右键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_RBUTTONUP:
				event.type = EVENT_MOUSE_RELEASED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 2; // 右键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_MBUTTONDOWN:
				event.type = EVENT_MOUSE_PRESSED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 3; // 中键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_MBUTTONUP:
				event.type = EVENT_MOUSE_RELEASED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				event.mouse.button = 3; // 中键
				global_writer->LogMouseEvent(event);
				break;
				
			case WM_MOUSEMOVE:
				event.type = EVENT_MOUSE_MOVED;
				event.mouse.x = mouseStruct->pt.x;
				event.mouse.y = mouseStruct->pt.y;
				// 可以选择是否记录鼠标移动事件，这里暂时不记录
				// global_writer->LogMouseEvent(event);
				break;
		}
	}
	
	// 调用下一个钩子
	return CallNextHookEx(mouse_hook, nCode, wParam, lParam);
}

// 安装全局鼠标钩子
static void install_global_mouse_hook()
{
	if (mouse_hook == NULL) {
		mouse_hook = SetWindowsHookEx(WH_MOUSE_LL, MouseProc, 
									GetModuleHandle(NULL), 0);
	}
}

// 卸载全局鼠标钩子
static void uninstall_global_mouse_hook()
{
	if (mouse_hook != NULL) {
		UnhookWindowsHookEx(mouse_hook);
		mouse_hook = NULL;
	}
}

// 安装全局键盘钩子
static void install_global_keyboard_hook(InfoWriter *writer)
{
	if (keyboard_hook == NULL) {
		global_writer = writer;
		keyboard_hook = SetWindowsHookEx(WH_KEYBOARD_LL, KeyboardProc, 
										GetModuleHandle(NULL), 0);
	}
	
#ifdef _WIN32
	// 同时安装鼠标钩子
	install_global_mouse_hook();
#endif
}

// 卸载全局键盘钩子
static void uninstall_global_keyboard_hook()
{
	if (keyboard_hook != NULL) {
		UnhookWindowsHookEx(keyboard_hook);
		keyboard_hook = NULL;
		global_writer = NULL;
	}
	
#ifdef _WIN32
	// 同时卸载鼠标钩子
	uninstall_global_mouse_hook();
#endif
}
#endif

bool obstudio_infowriter_syncnameandpathwithvideo_property_modified(
	obs_properties_t *props, obs_property_t *property, obs_data_t *settings)
{
	obs_property_t *prop_setting_file =
		obs_properties_get(props, setting_file);
	const bool previously_enabled = obs_property_enabled(prop_setting_file);
	const bool sync_selected =
		obs_data_get_bool(settings, setting_syncnameandpathwithvideo);

	obs_property_set_enabled(prop_setting_file, !sync_selected);

	obs_property_t *prop_automaticoutputextension =
		obs_properties_get(props, setting_automaticoutputextension);
	obs_property_set_visible(prop_automaticoutputextension, sync_selected);

	return (previously_enabled != obs_property_enabled(prop_setting_file));
}

void obstudio_infowriter_write_hotkey1(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(1);
	}
}

void obstudio_infowriter_write_hotkey2(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(2);
	}
}

void obstudio_infowriter_write_hotkey3(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(3);
	}
}

void obstudio_infowriter_write_hotkey4(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(4);
	}
}

void obstudio_infowriter_write_hotkey5(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(5);
	}
}

void obstudio_infowriter_write_hotkey6(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(6);
	}
}

void obstudio_infowriter_write_hotkey7(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(7);
	}
}
void obstudio_infowriter_write_hotkey8(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(8);
	}
}
void obstudio_infowriter_write_hotkey9(void *data, obs_hotkey_id id,
				       obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(9);
	}
}
void obstudio_infowriter_write_hotkey10(void *data, obs_hotkey_id id,
					obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(10);
	}
}
void obstudio_infowriter_write_hotkey11(void *data, obs_hotkey_id id,
					obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(11);
	}
}
void obstudio_infowriter_write_hotkey12(void *data, obs_hotkey_id id,
					obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(12);
	}
}
void obstudio_infowriter_write_hotkey13(void *data, obs_hotkey_id id,
					obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(13);
	}
}
void obstudio_infowriter_write_hotkey14(void *data, obs_hotkey_id id,
					obs_hotkey_t *hotkey, bool pressed)
{
	UNUSED_PARAMETER(id);
	UNUSED_PARAMETER(hotkey);

	if (pressed) {
		InfoWriter *Writer = static_cast<InfoWriter *>(data);

		Writer->WriteInfo(14);
	}
}

const char *obstudio_infowriter_get_name(void *type_data)
{
	UNUSED_PARAMETER(type_data);

	return infowriter_idname;
}

void LogSceneChange(InfoWriter *Writer, const std::string scenename)
{
	auto WriterSettings = Writer->GetSettings();

	if (WriterSettings->GetShouldLogSceneChanges()) {
		Writer->WriteSceneChange(scenename);
	}
}

void obsstudio_infowriter_frontend_event_callback(enum obs_frontend_event event,
						  void *private_data)
{
	InfoWriter *Writer = static_cast<InfoWriter *>(private_data);

	if (event == OBS_FRONTEND_EVENT_STREAMING_STARTED) {
		Writer->MarkStart(imtStream);
	} else if (event == OBS_FRONTEND_EVENT_RECORDING_STARTED) {
		Writer->MarkStart(imtRecording);
	} else if (event == OBS_FRONTEND_EVENT_STREAMING_STOPPED) {
		if (Writer->IsStreaming())
			Writer->MarkStop(imtStream);
	} else if (event == OBS_FRONTEND_EVENT_RECORDING_STOPPED) {
		Writer->MarkStop(imtRecording);
	} else if (event == OBS_FRONTEND_EVENT_RECORDING_PAUSED) {
		Writer->MarkPauseStart(imtRecordingPauseStart);
	} else if (event == OBS_FRONTEND_EVENT_RECORDING_UNPAUSED) {
		Writer->MarkPauseResume(imtRecordingPauseResume);
	} else if (event == OBS_FRONTEND_EVENT_SCENE_CHANGED) {
		auto scene = obs_frontend_get_current_scene();
		std::string scenename = obs_source_get_name(scene);
		obs_source_release(scene);

		LogSceneChange(Writer, scenename);
	}
}

void *obstudio_infowriter_create(obs_data_t *settings, obs_source_t *source)
{
	InfoWriter *Writer = new InfoWriter();
	// 将新创建的 Writer 赋值给全局变量
	g_infoWriter = Writer;
	
	UNUSED_PARAMETER(settings);

	obs_hotkey_register_source(source, "InfoWriter", "Hotkey 1",
				   obstudio_infowriter_write_hotkey1, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey2", "Hotkey 2",
				   obstudio_infowriter_write_hotkey2, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey3", "Hotkey 3",
				   obstudio_infowriter_write_hotkey3, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey4", "Hotkey 4",
				   obstudio_infowriter_write_hotkey4, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey5", "Hotkey 5",
				   obstudio_infowriter_write_hotkey5, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey6", "Hotkey 6",
				   obstudio_infowriter_write_hotkey6, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey7", "Hotkey 7",
				   obstudio_infowriter_write_hotkey7, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey8", "Hotkey 8",
				   obstudio_infowriter_write_hotkey8, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey9", "Hotkey 9",
				   obstudio_infowriter_write_hotkey9, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey10", "Hotkey 10",
				   obstudio_infowriter_write_hotkey10, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey11", "Hotkey 11",
				   obstudio_infowriter_write_hotkey11, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey12", "Hotkey 12",
				   obstudio_infowriter_write_hotkey12, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey13", "Hotkey 13",
				   obstudio_infowriter_write_hotkey13, Writer);
	obs_hotkey_register_source(source, "InfoWriter.Hotkey14", "Hotkey 14",
				   obstudio_infowriter_write_hotkey14, Writer);

	obs_frontend_add_event_callback(
		obsstudio_infowriter_frontend_event_callback, Writer);

	// 初始化键盘监听
	memset(key_hotkeys, 0, sizeof(key_hotkeys));
	register_all_key_hotkeys(Writer);

	return Writer;
}

obs_properties_t *obstudio_infowriter_get_properties(void *data)
{
	obs_properties_t *props = obs_properties_create();

	obs_property_t *p = obs_properties_add_bool(
		props, setting_syncnameandpathwithvideo,
		obs_module_text("Sync name and path with video recording"));
	obs_property_set_modified_callback(
		p, obstudio_infowriter_syncnameandpathwithvideo_property_modified);

	obs_properties_add_path(props, setting_file,
				obs_module_text("Log file"), OBS_PATH_FILE_SAVE,
				logfile_filter, NULL);

	obs_properties_add_text(props, setting_automaticoutputextension,
				obs_module_text("Automatic output extension"),
				OBS_TEXT_DEFAULT);

	obs_properties_add_text(props, setting_format,
				obs_module_text("Format"), OBS_TEXT_DEFAULT);

	obs_properties_add_text(props, setting_hotkey1text,
				obs_module_text("Hotkey 1 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey2text,
				obs_module_text("Hotkey 2 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey3text,
				obs_module_text("Hotkey 3 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey4text,
				obs_module_text("Hotkey 4 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey5text,
				obs_module_text("Hotkey 5 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey6text,
				obs_module_text("Hotkey 6 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey7text,
				obs_module_text("Hotkey 7 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey8text,
				obs_module_text("Hotkey 8 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey9text,
				obs_module_text("Hotkey 9 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey10text,
				obs_module_text("Hotkey 10 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey11text,
				obs_module_text("Hotkey 11 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey12text,
				obs_module_text("Hotkey 12 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey13text,
				obs_module_text("Hotkey 13 text"),
				OBS_TEXT_DEFAULT);
	obs_properties_add_text(props, setting_hotkey14text,
				obs_module_text("Hotkey 14 text"),
				OBS_TEXT_DEFAULT);

	obs_property_list_add_string(
		obs_properties_add_list(props, setting_outputformat,
					obs_module_text("Output format"),
					OBS_COMBO_TYPE_LIST,
					OBS_COMBO_FORMAT_STRING),
		obs_module_text("Default"), "default");
	obs_property_list_add_string(NULL, obs_module_text("EDL"), "edl");
	obs_property_list_add_string(NULL, obs_module_text("CSV"), "csv");
	obs_property_list_add_string(NULL, obs_module_text("SRT"), "srt");
	obs_property_list_add_string(NULL, obs_module_text("User Input"), "userinput");

	obs_properties_add_bool(props, setting_shouldlogscenechanges,
				obs_module_text("Log scene changes"));
	obs_properties_add_bool(props, setting_shouldlogstreaming,
				obs_module_text("Log streaming"));
	obs_properties_add_bool(props, setting_shouldlogabsolutetime,
				obs_module_text("Log absolute time"));
	obs_properties_add_bool(props, setting_shouldloghotkeyspecifics,
				obs_module_text("Log hotkey specifics"));

	// 添加记录所有按键的选项
	obs_properties_add_bool(props, "record_all_keys",
				obs_module_text("Record all keyboard and mouse events"));

	return props;
}

void obstudio_infowriter_get_defaults(obs_data_t *settings)
{
	obs_data_set_default_string(settings, setting_file, "infowriter.txt");
	obs_data_set_default_string(settings, setting_format, "%d:%02d:%02d");
	obs_data_set_default_bool(settings, setting_syncnameandpathwithvideo,
				  false);
	obs_data_set_default_string(settings, setting_automaticoutputextension,
				    "txt");
	obs_data_set_default_string(settings, setting_hotkey1text, "Hotkey 1");
	obs_data_set_default_string(settings, setting_hotkey2text, "Hotkey 2");
	obs_data_set_default_string(settings, setting_hotkey3text, "Hotkey 3");
	obs_data_set_default_string(settings, setting_hotkey4text, "Hotkey 4");
	obs_data_set_default_string(settings, setting_hotkey5text, "Hotkey 5");
	obs_data_set_default_string(settings, setting_hotkey6text, "Hotkey 6");
	obs_data_set_default_string(settings, setting_hotkey7text, "Hotkey 7");
	obs_data_set_default_string(settings, setting_hotkey8text, "Hotkey 8");
	obs_data_set_default_string(settings, setting_hotkey9text, "Hotkey 9");
	obs_data_set_default_string(settings, setting_hotkey10text, "Hotkey 10");
	obs_data_set_default_string(settings, setting_hotkey11text, "Hotkey 11");
	obs_data_set_default_string(settings, setting_hotkey12text, "Hotkey 12");
	obs_data_set_default_string(settings, setting_hotkey13text, "Hotkey 13");
	obs_data_set_default_string(settings, setting_hotkey14text, "Hotkey 14");
	obs_data_set_default_string(settings, setting_outputformat, "default");
	obs_data_set_default_bool(settings, setting_shouldlogscenechanges, true);
	obs_data_set_default_bool(settings, setting_shouldlogstreaming, true);
	obs_data_set_default_bool(settings, setting_shouldlogabsolutetime, true);
	obs_data_set_default_bool(settings, setting_shouldloghotkeyspecifics,
				  true);
	// 设置记录所有按键的默认值为true
	obs_data_set_default_bool(settings, "record_all_keys", true);
}

void obstudio_infowriter_update(void *data, obs_data_t *settings)
{
	InfoWriter *Writer = static_cast<InfoWriter *>(data);

	const char *outputformat =
		obs_data_get_string(settings, setting_outputformat);

	const char *automaticextension =
		obs_data_get_string(settings, setting_automaticoutputextension);
	const char *file = obs_data_get_string(settings, setting_file);
	const char *format = obs_data_get_string(settings, setting_format);

	auto WriterSettings = Writer->GetSettings();

	WriterSettings->SetOutputFormat(outputformat);
	WriterSettings->SetShouldSyncNameAndPathWithVideo(
		obs_data_get_bool(settings, setting_syncnameandpathwithvideo));
	WriterSettings->SetAutomaticOutputExtension(automaticextension);
	WriterSettings->SetFilename(file);
	WriterSettings->SetFormat(format);

	const char *hotkeytext;

	hotkeytext = obs_data_get_string(settings, setting_hotkey1text);
	WriterSettings->SetHotkeyText(1, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey2text);
	WriterSettings->SetHotkeyText(2, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey3text);
	WriterSettings->SetHotkeyText(3, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey4text);
	WriterSettings->SetHotkeyText(4, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey5text);
	WriterSettings->SetHotkeyText(5, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey6text);
	WriterSettings->SetHotkeyText(6, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey7text);
	WriterSettings->SetHotkeyText(7, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey8text);
	WriterSettings->SetHotkeyText(8, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey9text);
	WriterSettings->SetHotkeyText(9, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey10text);
	WriterSettings->SetHotkeyText(10, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey11text);
	WriterSettings->SetHotkeyText(11, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey12text);
	WriterSettings->SetHotkeyText(12, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey13text);
	WriterSettings->SetHotkeyText(13, hotkeytext);

	hotkeytext = obs_data_get_string(settings, setting_hotkey14text);
	WriterSettings->SetHotkeyText(14, hotkeytext);

	WriterSettings->SetShouldLogSceneChanges(
		obs_data_get_bool(settings, setting_shouldlogscenechanges));
	WriterSettings->SetShouldLogStreaming(
		obs_data_get_bool(settings, setting_shouldlogstreaming));
	WriterSettings->SetShouldLogAbsoluteTime(
		obs_data_get_bool(settings, setting_shouldlogabsolutetime));
	WriterSettings->SetShouldLogHotkeySpecifics(
		obs_data_get_bool(settings, setting_shouldloghotkeyspecifics));

	// 读取是否启用全局键盘记录
	bool record_all_keys = obs_data_get_bool(settings, "record_all_keys");

	// 根据设置启用或禁用键盘记录
#ifdef _WIN32
	if (record_all_keys) {
		install_global_keyboard_hook(Writer);
	} else {
		uninstall_global_keyboard_hook();
	}
#endif

	// 同时处理普通热键注册
	static bool keys_registered = false;
	if (record_all_keys && !keys_registered) {
		register_all_key_hotkeys(Writer);
		keys_registered = true;
	} else if (!record_all_keys && keys_registered) {
		unregister_all_key_hotkeys();
		keys_registered = false;
	}
}

uint32_t obstudio_infowriter_get_width(void *data)
{
	UNUSED_PARAMETER(data);

	return 0;
}

uint32_t obstudio_infowriter_get_height(void *data)
{
	UNUSED_PARAMETER(data);

	return 0;
}

void obstudio_infowriter_destroy(void *data)
{
	InfoWriter *Writer = static_cast<InfoWriter *>(data);
	if (Writer != nullptr) {
		if (Writer->HasStarted()) {
			Writer->MarkStop(imtUnknown);
		}

		obs_frontend_remove_event_callback(
			obsstudio_infowriter_frontend_event_callback, Writer);

		// 注销键盘监听
		unregister_all_key_hotkeys();

		// 清除全局变量引用
		if (g_infoWriter == Writer) {
			g_infoWriter = nullptr;
		}

		delete Writer;
	}
}

struct obs_source_info obstudio_infowriter_source;

OBS_DECLARE_MODULE()
OBS_MODULE_USE_DEFAULT_LOCALE("OBSInfoWriter", "en-US")

void obstudio_infowriter_setup()
{
	obstudio_infowriter_source.id = infowriter_idname;
	obstudio_infowriter_source.type = OBS_SOURCE_TYPE_INPUT;
	obstudio_infowriter_source.get_name = obstudio_infowriter_get_name;
	obstudio_infowriter_source.create = obstudio_infowriter_create;
	obstudio_infowriter_source.destroy = obstudio_infowriter_destroy;
	obstudio_infowriter_source.get_width = obstudio_infowriter_get_width;
	obstudio_infowriter_source.get_height = obstudio_infowriter_get_height;
	obstudio_infowriter_source.get_properties =
		obstudio_infowriter_get_properties;
	obstudio_infowriter_source.update = obstudio_infowriter_update;
	obstudio_infowriter_source.load = obstudio_infowriter_update;
	obstudio_infowriter_source.get_defaults =
		obstudio_infowriter_get_defaults;

	obs_register_source(&obstudio_infowriter_source);
}

bool obs_module_load(void)
{
	obstudio_infowriter_setup();

	return true;
}

void obs_module_unload(void)
{
	// 注销键盘监听
	unregister_all_key_hotkeys();
}
