#Requires AutoHotkey v2.0
#SingleInstance Force

A_IconTip := "DisplayToggler"
A_TrayMenu.Delete()
A_TrayMenu.Add("Toggle Displays", (*) => toggleDisplays())
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (*) => ExitApp())

; Add the full path here if you didn't add it to PATH and this file resides in a different folder from this script
multiMonitorTool := "MultiMonitorTool.exe"

; Splits a CSV line, respecting quoted fields
parseCSVLine(line) {
    fields := []
    i := 1, len := StrLen(line)
    insideQuotes := false, field := ""
    
    while i <= len {
        char := SubStr(line, i, 1)
        nextChar := (i < len) ? SubStr(line, i+1, 1) : ""

        if (char = Chr(34)) {
            if (insideQuotes && nextChar = Chr(34)) {
                field .= Chr(34)
                i += 1
            } else {
                insideQuotes := !insideQuotes
            }
        } else if (char = "," && !insideQuotes) {
            fields.Push(field)
            field := ""
        } else {
            field .= char
        }
        i += 1
    }
    fields.Push(field)
    return fields
}

getDisplay2Status() {
    RunWait multiMonitorTool " /scomma monitors.csv", , "Hide"

    if !FileExist("monitors.csv")
        return "Error: CSV not found"

    csvContent := FileRead("monitors.csv")
    lines := StrSplit(csvContent, "`n", "`r")
    if lines.Length < 2
        return "Error: CSV content incomplete"

    headers := parseCSVLine(lines[1])
    activeIndex := 0
    for i, field in headers {
        if (Trim(field) = "Active") {
            activeIndex := i
            break
        }
    }
    if (!activeIndex)
        return "Error: 'Active' column not found"

    for i, line in lines {
        if (i = 1 || line = "")
            continue
        if InStr(line, "\\.\DISPLAY2") {
            fields := parseCSVLine(line)
            return Trim(fields[activeIndex]) ; "Yes" or "No"
        }
    }
    return "Error: DISPLAY2 not found"
}

initialTrayIcon() {
    status := getDisplay2Status()
    if InStr(status, "Error") {
        MsgBox status
        return
    }

    if (status = "Yes") {
        TraySetIcon("extended.ico", , true)
        A_IconTip := "Monitors Extended"
    } else {
        TraySetIcon("monitor1.ico", , true)
        A_IconTip := "Monitor 1 Active"
    }
}

initialTrayIcon()

toggleDisplays() {
    status := getDisplay2Status()
    if InStr(status, "Error") {
        MsgBox status
        return
    }

    if (status = "Yes") {
        RunWait multiMonitorTool " /disable 2", , "Hide"
        TraySetIcon("monitor1.ico", , true)
        A_IconTip := "Monitor 1 Active"
    } else {
        RunWait multiMonitorTool " /enable 2", , "Hide"
        TraySetIcon("extended.ico", , true)
        A_IconTip := "Monitors Extended"
    }
}


; Hotkey: Ctrl+Alt+D
^!d::toggleDisplays()
