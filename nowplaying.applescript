#!/usr/bin/env osascript

tell application "System Events"
	set myList to (name of every process)
end tell

if myList contains "iTunes" then
	tell application "iTunes"
		set trackname to name of current track
		set artistname to artist of current track
		set albumname to album of current track

		set trackduration to duration of current track
		set trackposition to player position
		set elapsed to round (trackposition / trackduration * 100)

		if player state is playing then
			set output to ""
		else if player state is paused then
			set output to "❙❙ "
		else
			set output to ""
		end if

		set output to output & trackname & " – " & artistname & " (" & albumname & ")"
	end tell
else
	set output to ""
end if
