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
```

## Installation
1. Install AutoHotkey v2 if you haven't already (optionally Ahk2Exe compiler)
2. Place the script `.ahk` file, the following `.ico` files in the same folder:
   - `monitor1.ico`
   - `extended.ico`
3. Make sure MultiMonitorTool is accessible (see above).
4. Use the system tray right-click menu or press **Ctrl + Alt + D** to toggle adapters.

## Notes
- The script creates a 2KB file [`monitors.csv`] to read monitor status which is overwritten with each toggle (no bloat).
- This script expects that Monitor 1 is your primary monitor and Monitor 2 is your extended monitor.

## Support
- If you encounter any issues or have suggestions for improvements, please open an issue. We appreciate your feedback and are always looking to improve the tool.

Enjoy and customize to your liking!
