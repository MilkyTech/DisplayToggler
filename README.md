# DisplayToggler (AutoHotkey v2)

A lightweight tray utility for **quickly switching Windows display modes** without breaking refresh rates, resolutions, or sanity.

Built with AutoHotkey v2 and Windows’ native `DisplaySwitch.exe` for maximum reliability.

---

## ✨ Features

- One-click tray toggle between:
  - **Primary display only**
  - **Extended displays**
- Right-click tray menu with all modes:
  - Primary only
  - Secondary only
  - Duplicate
  - Extend
- Global hotkey support (`Ctrl + Alt + D`)
- Custom tray icons for each display mode
- Preserves:
  - Refresh rate
  - Resolution
  - Color depth
- Works reliably on **Windows 10 & Windows 11**
- No third-party dependencies

---

## 🚀 Why This Exists

Earlier versions used NirSoft’s **MultiMonitorTool**, which works well in many cases but can reset refresh rates (e.g. 60 Hz → 29.97 Hz) when disabling and re-enabling displays.

This version uses **Windows’ built-in `DisplaySwitch.exe`**, which:
- Preserves display timing correctly
- Matches the behavior of Windows display settings
- Avoids driver reinitialization quirks

Result: **no more refresh-rate surprises**.

---

## 🖱️ Usage

### Tray Icon
- **Left-click** → Toggle between *Primary Only* and *Extend*
- **Right-click** → Select any display mode directly

### Hotkey
- **Ctrl + Alt + D** → Toggle between *Primary Only* and *Extend*

---

## 🧠 Display Modes Used

Internally, this tool calls:

- DisplaySwitch.exe /internal
- DisplaySwitch.exe /external
- DisplaySwitch.exe /clone
- DisplaySwitch.exe /extend


These are official Windows display modes and are safe to use.

---

## 🛠️ Build / Compile Notes

- Script is written for **AutoHotkey v2**
- **Must be compiled using AutoHotkey64**
  - Required to avoid WOW64 filesystem redirection
  - Ensures `DisplaySwitch.exe` executes correctly
- No admin privileges required

---

## 📁 Files

- `DisplayToggler.ahk` – main AutoHotkey v2 script
- `DisplayToggler.exe` – compiled executable (optional convenience build)
- `*.ico` – custom tray icons (same directory as script/exe)
- `README.md` – this file

---

## 🔍 About the Compiled Executable

A pre-compiled `DisplayToggler.exe` is provided **for convenience only**.

- The executable is compiled directly from the included `.ahk` script
- No obfuscation, packing, or external dependencies are used
- The script can be reviewed, modified, and compiled by anyone

If you prefer:
- Run the `.ahk` script directly, or
- Compile the executable yourself using **AutoHotkey64**

Both approaches are fully supported.

---

## 🏁 License

MIT — use it, fork it, improve it, ship it.

---

## 🙌 Credits

- AutoHotkey v2
- Windows `DisplaySwitch.exe`
- NirSoft (for earlier inspiration)

Enjoy and customize to your liking!
