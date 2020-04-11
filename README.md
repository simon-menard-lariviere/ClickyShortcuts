# ClickyShortcuts
Simple way to create keyboard shortcuts that click on the screen.
See it in use : https://youtu.be/1uOKNS07ix8

## Requirements
AutoHotkey : https://www.autohotkey.com/

## Instructions
You will need to run ClickyShortcuts.ahk.
See https://www.autohotkey.com/docs/Program.htm for more details.
But first, there is a line you need to edit in ClickyShortcuts.ahk. Adapt the following line to your game .exe :

*#IfWinActive ahk_exe KingdomsAndCastles.exe*

This will ensure that shortcuts only work in this program, so you can safely type elsewhere.

**Ctrl + #** (Hold control key and press the pound key) Enables the Capture mode. Pressing # exits the Capture mode. Pressing any other keys will save current mouse location.

**Normal Mode** Backspace erases all saved shortcuts. Pressing keys saved during Capture mode will click the saved location and return cursor to its previous location.
