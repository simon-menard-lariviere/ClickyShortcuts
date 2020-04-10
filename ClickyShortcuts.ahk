#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#IfWinActive ahk_exe notepad++.exe ; For debugging in another program
#IfWinActive ahk_exe KingdomsAndCastles.exe
#SingleInstance force
SendMode Event

KeyPositions := {}

; Ctrl + #. Toggles Capture mode, which while associate a key to a mouse position.
^Sc029::
Sound("on")

;Wait for input, (L1) means limited to 1 key
Input key, L1
while (key != "#")
{
	SoundBeep 500
	Hotkey, %key%, OnKeyPressed
	MouseGetPos, x, y
	position := new Position(x, y)
	KeyPositions[key] := position
	Input key, L1
}

Sound("off")
return

BACKSPACE::
Reload
return

OnKeyPressed:
ClickAndReturn(A_ThisHotkey)
return

ClickAndReturn(key)
{
	global KeyPositions
	
	position := KeyPositions[key]
    MouseGetPos, initialX, initialY
	MouseClick, left, position.X, position.Y
	MouseMove, initialX, initialY
}

Sound(value)
{
	length := 100
	if(value = "on"){
		SoundBeep 500, length
		SoundBeep 750, length
	}
	else if("off"){
		SoundBeep 750, length
		SoundBeep 500, length
	}
}

class Position
{
	__New(x, y)
	{
		this.X := x
		this.Y := y
	}
}