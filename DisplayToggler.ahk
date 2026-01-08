#Requires AutoHotkey v2.0
#SingleInstance Force

; ---- CONFIG ----
icon_internal  := "monitor1.ico"
icon_external  := "monitor2.ico"
icon_clone     := "duplicate.ico"
icon_extend    := "extended.ico"

; ---- DETECT INITIAL STATE ----
initialMode := detectInitialDisplayMode()
runDisplaySwitch(initialMode)
toggleState := (initialMode = "/extend")

; ---- TRAY SETUP ----

OnMessage(0x404, TrayClickHandler)

TrayClickHandler(wParam, lParam, *) {
    ; 0x202 = WM_LBUTTONUP (left button released)
    if (lParam = 0x202) {
        toggleDisplays()
    }
}

TrayMenu := A_TrayMenu
TrayMenu.Delete()
TrayMenu.Add("Show Only on Primary", (*) => runDisplaySwitch("/internal"))
TrayMenu.Add("Show Only on Secondary", (*) => runDisplaySwitch("/external"))
TrayMenu.Add("Duplicate Displays",      (*) => runDisplaySwitch("/clone"))
TrayMenu.Add("Extend Displays",         (*) => runDisplaySwitch("/extend"))
TrayMenu.Add()
TrayMenu.Add("Exit", (*) => ExitApp())

; ---- TOGGLE FUNCTIONALITY ----
toggleDisplays() {
    global toggleState
    toggleState := !toggleState
    runDisplaySwitch(toggleState ? "/extend" : "/internal")
}

runDisplaySwitch(mode) {
    displaySwitch := A_WinDir "\System32\DisplaySwitch.exe"
	
	RunWait A_ComSpec ' /c "' displaySwitch '" ' mode, , "Hide"

    switch mode {
        case "/internal":
            TraySetIcon(icon_internal)
            A_IconTip := "DisplayToggler - Primary Only"
        case "/external":
            TraySetIcon(icon_external)
            A_IconTip := "DisplayToggler - Secondary Only"
        case "/clone":
            TraySetIcon(icon_clone)
            A_IconTip := "DisplayToggler - Duplicate Displays"
        case "/extend":
            TraySetIcon(icon_extend)
            A_IconTip := "DisplayToggler - Extended Display"
    }
}

; ---- DISPLAY DETECTION (PowerShell + SysGet) ----
detectInitialDisplayMode() {
    psCmd := 'Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorConnectionParams | Where-Object { $_.Active } | Measure-Object | Select -ExpandProperty Count'
    activeCount := Trim(execPS(psCmd))
		
	virtualWidth := SysGet(78)  ; SM_CXVIRTUALSCREEN
	screenWidth := SysGet(0)    ; SM_CXSCREEN

    if (activeCount = "1")
        return "/internal"
    else if (virtualWidth > screenWidth)
        return "/extend"
    else
        return "/clone"
}

execPS(command) {
    shell := ComObject("WScript.Shell")
    exec := shell.Exec("powershell -NoProfile -Command " . command)
    return exec.StdOut.ReadAll()
}


; Hotkey: Ctrl+Alt+D
^!d::toggleDisplays()