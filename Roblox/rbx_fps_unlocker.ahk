#Requires AutoHotkey v2.0
#SingleInstance Force

MsgBox "
(
This is info about the .ahk you are opening

This script will modify Roblox's settings file (GlobalBasicSettings_13.xml)

It ONLY changes your FPS cap.

Make sure Roblox is closed before running.

You can set any value under 10000.
)",
"rbx_fps_unlocker.ahk - [INFO]",
"Iconi"

if ProcessExist("RobloxPlayerBeta.exe") {
    MsgBox("Roblox is currently running.`nPlease close it first.", "Error", "Iconx")
    ExitApp
}

IB := InputBox(
    "Enter your desired FPS cap:`nExamples: 144, 240, 360",
    "Set FPS Cap",
    "w300 h130"
)

if (IB.Result = "Cancel" || IB.Value = "")
    ExitApp

NewFPS := Trim(IB.Value)

if (!IsNumber(NewFPS) || NewFPS < 1) {
    MsgBox("Invalid number.", "Error", "Iconx")
    ExitApp
}

if (NewFPS > 10000) {
    MsgBox("Please use a value under 10000.", "Error", "Iconx")
    ExitApp
}

LocalAppData := EnvGet("LOCALAPPDATA")

FilePath := LocalAppData "\Roblox\GlobalBasicSettings_13.xml"
BackupPath := LocalAppData "\Roblox\GlobalBasicSettings_13_backup.xml"

if (!FileExist(FilePath)) {
    MsgBox("Settings file not found.`nRun Roblox once first.", "Error", "Iconx")
    ExitApp
}

try {
    if FileExist(BackupPath)
        FileDelete(BackupPath)

    FileCopy(FilePath, BackupPath)
} catch Error as err {
    MsgBox("Backup failed:`n" err.Message, "Error", "Iconx")
    ExitApp
}

try {
    Content := FileRead(FilePath, "UTF-8")
} catch Error as err {
    MsgBox("Failed to read file:`n" err.Message, "Error", "Iconx")
    ExitApp
}

Replaced := false

NewContent := RegExReplace(
    Content,
    '(<int\s+name="FramerateCap">)(.*?)(</int>)',
    "$1" NewFPS "$3",
    &Count1
)

if (Count1 > 0)
    Replaced := true

if (!Replaced) {
    NewContent := RegExReplace(
        Content,
        '(<Framerate>)(.*?)(</Framerate>)',
        "$1" NewFPS "$3",
        &Count2
    )

    if (Count2 > 0)
        Replaced := true
}

if (!Replaced) {
    MsgBox("Could not find FPS setting.", "Error", "Iconx")
    ExitApp
}

try {
    f := FileOpen(FilePath, "w", "UTF-8")
    f.Write(NewContent)
    f.Close()
} catch Error as err {
    MsgBox("Failed to write file:`n" err.Message, "Error", "Iconx")
    ExitApp
}

MsgBox "
(
Success!

FPS cap set to: " NewFPS "

Backup created:
GlobalBasicSettings_13_backup.xml
)",
"Done",
"Iconi"
