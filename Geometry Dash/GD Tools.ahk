#Requires AutoHotkey v2.0
#SingleInstance Force

MsgBox "
(
GD Tools.ahk - Info

F1  = Toggle script ON/OFF
F2  = Restart script
Ctrl+Esc = Exit script

When the script is ON:

F  = Hold Space
J  = Hold Left Mouse Button
G  = Hold Up Arrow
H  = Hold W

1  = Ultra-fast auto-spacer (Space spam)
2  = Wave-perfect auto-spacer
3  = Ship/Wave hybrid auto-spacer

This script does NOT modify game files or memory.
It only sends normal keyboard inputs.
)"


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

$V:: {
   Send "Z"
}

$B:: {
   Send "X"
}

#HotIf
F2:: {
    scriptPath := A_ScriptFullPath
    Run(scriptPath)
    ExitApp()
}

^Esc::ExitApp
