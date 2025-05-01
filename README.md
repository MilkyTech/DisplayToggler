# DisplayToggler

A lightweight AutoHotkey v2 script that toggles between single-monitor and extended dual-monitor display modes using [NirSoft's MultiMonitorTool](https://www.nirsoft.net/utils/multi_monitor_tool.html).

## Features

- Toggles between *Primary Display Only* and *Dual Displays ("Extend these displays" mode)*
- Reflects initial display state via system tray icon
- Supports right-click tray menu and `Ctrl + Alt + D` hotkey

## Requirements

- **AutoHotkey v2.0+** — [Download here](https://www.autohotkey.com/download/)
- **MultiMonitorTool.exe** from NirSoft — [Download here](https://www.nirsoft.net/utils/multi_monitor_tool.html)

**Important:**  
If you want to install MultiMonitorTool into `C:\Program Files\` or any other location, make sure to add its folder path to your System Environment Variables.  
Otherwise, the script won't find `MultiMonitorTool.exe`.  
*(Or just toss the `MultiMonitorTool.exe` in the same folder as the script if you want to keep it easy.)*  
Alternatively, specify the full path in the script like this:

```ahk
multiMonitorTool := "C:\\Path\\To\\MultiMonitorTool.exe"
