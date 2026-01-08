# Changelog

## [2.0.0] – 2026-01-08

### Changed
- Replaced NirSoft MultiMonitorTool with Windows-native `DisplaySwitch.exe`
- Display switching now preserves:
  - Refresh rate
  - Resolution
  - Color depth
- Compiled executable now uses AutoHotkey64 to avoid WOW64 redirection issues

### Added
- Pre-compiled `DisplayToggler.exe` for convenience
- Right-click tray menu with all display modes:
  - Primary only
  - Secondary only
  - Duplicate
  - Extend
- Startup detection of current display mode
- Automatic tray icon sync with active display mode
- Global hotkey (`Ctrl + Alt + D`) for quick toggling

### Fixed
- Refresh rate reverting to 29.97 / 25 Hz when toggling displays
- Inconsistent behavior between script and compiled executable

---

## [1.x] – Legacy Versions

- Initial implementation using NirSoft MultiMonitorTool
- Basic tray toggle functionality
