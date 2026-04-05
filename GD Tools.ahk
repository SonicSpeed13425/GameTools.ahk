#Requires AutoHotkey v2.0
#SingleInstance Force

A_MaxHotkeysPerInterval := 15000
A_HotkeyInterval := 15000
SendMode "Event"

global Toggle := true

F1:: {
    global Toggle
    Toggle := !Toggle
    ToolTip Toggle ? "Script: ON" : "Script: OFF"
    SetTimer () => ToolTip(), -1000
}

#HotIf Toggle

$F::Send "{Space down}"
$F Up::Send "{Space up}"

$J::Send "{LButton down}"
$J Up::Send "{LButton up}"

$G::Send "{Up down}"
$G Up::Send "{Up up}"

$H::Send "{w down}"
$H Up::Send "{w up}"

$1:: {
    while GetKeyState("1", "P") && Toggle {
        Send "{Space down}"
        Sleep 20
        Send "{Space up}"
        Sleep 1
    }
}

$2:: {
    while GetKeyState("2", "P") && Toggle {
        Send "{Space down}"
        Sleep 55
        Send "{Space up}"
        Sleep 55
    }
}

$3:: {
    while GetKeyState("3", "P") && Toggle {
        Send "{Space down}"
        Sleep 35
        Send "{Space up}"
        Sleep 7
    }
}

#HotIf
F2:: {
    scriptPath := A_ScriptFullPath
    Run(scriptPath)
    ExitApp()
}

^Esc::ExitApp