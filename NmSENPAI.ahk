global WindowTitle := "notepad" ;Default window name
global Transparency := 255
global Border := 0
global vis := 0

Gui, Add, Tab, x2 y-1 w480 h380 , Info|Hotkeys
Gui, Add, Picture, x2 y19 w620 h360 , C:\Users\Canti\Pictures\1_slmDH-lcTDCYxr6OUtgYvg.png
Gui, Add, Text, x12 y29 w160 h20 +BackgroundTrans, Welcome To Notice Me Senpai
Gui, Add, Text, x12 y279 w240 h80 +Center, Notice me senpai is a program that lets you take a window and float it over all others on your desktop. There are other features like changing the opacity`, size`, and more. Make sure you take a look at the HOTKEYS tab before closeing this window.
Gui, Tab, Hotkeys
Gui, Add, Text, x202 y29 w60 h20 , HOTKEYS
Gui, Add, Text, x12 y79 w160 h20 , CRL + Shift + O: Open the menu.
Gui, Add, Text, x12 y59 w70 h20 , --Menu Key--
Gui, Tab, Hotkeys
Gui, Add, Text, x12 y109 w100 h20 , --Slecting a window--
Gui, Add, Text, x12 y129 w190 h20 , CRL + Shift + R: set the Target Window
Gui, Add, Text, x12 y149 w240 h20 , CRL + Shift + A: Toggle floating of seleted window
Gui, Add, Text, x12 y239 w180 h20 , CRL + Shift + Q: Decrece the opacity
Gui, Add, Text, x12 y219 w180 h20 , CRL + Shift + W: Increce the opacity
Gui, Add, Text, x12 y199 w210 h20 , CRL + Shift + B: toggle the Window border
Gui, Add, Text, x12 y179 w110 h20 , --Window Attributes--
Gui, Tab, Hotkeys
Gui, Add, Text, x12 y259 w250 h20 , CRL + Shift + 1: change the window size 440 x 254
Gui, Add, Text, x12 y279 w250 h20 , CRL + Shift + 2: change the window size 652 x 375
Gui, Add, Text, x12 y299 w250 h20 , CRL + Shift + 3: change the window size 1047 x 595
Gui, Add, Text, x332 y59 w110 h20 , --Window Movement--
Gui, Add, Text, x332 y79 w90 h20 , CRL + Shift + UP
Gui, Add, Text, x332 y99 w100 h20 , CRL + Shift + Down
Gui, Add, Text, x332 y119 w90 h20 , CRL + Shift + Left
Gui, Add, Text, x332 y139 w100 h20 , CRL + Shift + Right
; Generated using SmartGUI Creator 4.0
Gui, Show, x220 y186 h380 w483, Notice me Senpai 3.1

refresh()
{
	ifWinActive, %WindowTitle% 
	{
		Winset, Transparent, %Transparency%, %WindowTitle%
	}
}

^+q:: ;Transparency down

	if Transparency > 30
	{
		Transparency := Transparency - 10
	} else {
		Transparency := 30
	}
	refresh()

return

^+w:: ;Turn transparency up

	if Transparency < 255 
	{
		Transparency := Transparency + 10
	} else {
		Transparency := 255
	}
	refresh()
return

^+a:: ;Set always on top
	ifWinActive, %WindowTitle%
	{
		Winset, AlwaysOnTop, toggle
	}
	refresh()
return

^+r:: ;Set window
	WinGetTitle, WindowTitle, A
	refresh()
return

^+Up::
	upWindow()
{
    WinGetPos,,, Width, Height, %WindowTitle%
    WinMove, %WindowTitle%,,,40
}
	refresh()	
return

^+Down::
	bottemWindow()
{
    WinGetPos,,, Width, Height, %WindowTitle%
    WinMove, %WindowTitle%,,,(A_ScreenHeight)-(Height+45)
}
		refresh()
return

^+Left::
	leftWindow()
{
    WinGetPos,,, Width, Height, %WindowTitle%
    WinMove, %WindowTitle%,,1
}
		refresh()
return

^+Right::
	rigthWindow()
{
    WinGetPos,,, Width, Height, %WindowTitle%
    WinMove, %WindowTitle%,,(A_ScreenWidth)-(Width+1)
}
		refresh()
return

^+O::

Gui, Show, x220 y186 h380 w483, Notace me Senpai 3.0
Return


; here are the exparements

^+B::
if (Border = 0){
WinSet, Style, 	-0xC00000, %WindowTitle%
Border := 1
} else {
WinSet, Style, +0xC00000, %WindowTitle%
Border := 0
}
return

^+1:: ;small size
WinWait, %WindowTitle%
sleep, 50
WinMove, %WindowTitle%, , , , 440, 254
return

^+2::
WinWait, %WindowTitle%
sleep, 50
WinMove, %WindowTitle%, , , , 652, 375
return

^+3::
WinWait, %WindowTitle%
sleep, 50
WinMove, %WindowTitle%, , , , 1047, 595
return