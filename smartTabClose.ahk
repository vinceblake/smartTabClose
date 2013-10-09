; This script will close any IE tab open to a URL that doesn't appear in a file called Whitelist.txt

IfExist, WhiteList.txt ; Check whether the necessary file exists.
{

	Loop, Read, whitelist.txt ; Make a comma-delineated list out of the lines in Whitelist.txt
	{
		If (A_Index = 1)
			whitelist := A_LoopReadLine ; Add the first line of text to the whitelist
		Else
			whitelist := whitelist "," A_LoopReadLine ; Append all subsequent lines
	}

Close:	
	for window in ComObjCreate("Shell.Application").Windows	; Identify each open window, one by one
	{
		name := window.FullName ; Determine the name of the current window
		if InStr(name,"iexplore") ; Check whether it's an IE window, and if so...
		{
			URL := Window.locationURL ; Check each open tab in the window
			If URL not contains %whitelist% ; If any tabs are open to a URL not in the whitelist...
			{
				window.quit() ; Close it, and...
				GoSub, Close ; Move onto the next IE window.
			}
		}
	}
	
return ; If there are no more IE windows, stop.
}
