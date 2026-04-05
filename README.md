# GameTools.ahk

GameTools.ahk is a small collection of AutoHotkey v2 scripts I use for various games.

A small number of tools (like ***RBX_FPS_UNLOCKER.ahk***) may edit a game's **local settings file** to change things such as FPS caps.
This is just one example — other tools in this repository may edit different **local settings files** for different purposes.
These edits are **safe**, **optional**, and **fully user‑controlled**.
All other tools only send **normal keyboard inputs**.

## ❓ What is AutoHotkey and how do I get it?
- AutoHotkey is a simple but powerful scripting language for Windows. It can automate keys, create GUIs, and build small tools like the ones in this repository.
- You can download AutoHotkey from the official website: https://www.autohotkey.com/
- Some AutoHotkey scripts online can be malicious, especially compiled `.exe` versions. Everything in this repository is **open‑source .ahk files**, so you can read the code yourself and know it’s safe.

## 🎮 What kind of tools are in this repository?
Over time, this repo will include multiple AHK tools for different games I play.  
(As of 05/04/2026, only a few are uploaded, but more will come.)

## ❓ Does this include cheat software?
No.  
These scripts are simple input tools — not cheats, not memory editors, not injectors.

## 🕹️ What games will have tools here?
Any game I play that benefits from small AHK utilities.

### Example: GD Tools (Geometry Dash)
The first script uploaded here is **GD Tools.ahk**, made because Geometry Dash is fast‑paced and doesn’t explain much to new players.

GD Tools includes:
- F, G, H, J remapped to jump keys  
- Three auto‑spacer modes:
  - **1** → extremely fast auto‑spacer  
  - **2** → wave‑perfect auto‑spacer  
  - **3** → ship/wave hybrid auto‑spacer  

These are just input helpers — nothing that modifies the game itself.

### Tommorow: NEW TOOL!1!1!1!
RBX_FPS_UNLOCKER.ahk is a simple tool that lets you change your Roblox FPS cap to any value you choose as long as its under the value 10,000 (do not include commas when inputting value, i just used commas to make it clearer)

### ❓ Why tommorow?
i've had a bit to many contributions today and would like to do it tommorow rather than burning myself out and more!

Note: **RBX_FPS_UNLOCKER** will modify the globalbasicsettings_13.xml file, find `<int name="FramerateCap">yourfpscap</int>` then edit it to the value you input into the input box
