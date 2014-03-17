launch application "System Preferences"

#Toggle channel output. Tried to run both settings from a single block, but unsuccessful
tell application "System Preferences"
	reveal anchor "Hearing" of pane id "com.apple.preference.universalaccess"
end tell

tell application "System Events"
	set monoStereoCheckbox to checkbox 2 of group 1 of window "Accessibility" of process "System Preferences"
	if (get value of monoStereoCheckbox) as boolean is true then
		set ddMessage to "Reverting to STEREO Audio"
	else
		set ddMessage to "Switching to MONO Audio"
	end if
	
	
	tell monoStereoCheckbox to click
end tell

#Toggle channel balance
tell application "System Preferences"
	reveal anchor "output" of pane id "com.apple.preference.sound"
end tell

tell application "System Events"
	set balanceSlider to slider 1 of group 1 of tab group 1 of window 1 of process "System Preferences"
	if (get value of balanceSlider) is 0.5 then #0=left, 1=right, 0.5=L/R balanced
		set value of balanceSlider to 0
	else
		set value of balanceSlider to 0.5
	end if
	
end tell
