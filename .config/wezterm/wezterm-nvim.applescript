-- Open Automator
-- Create "Application"
-- Add "Run AppleScript" with the contents of this file
-- Save into Applications
-- Customize icon by drag&drop into the top-left corner of the application Get Info dialog (Cmd+I)

on run {input, parameters}
  if input is not {} then
    repeat with targetFile in input
	  set targetFile to POSIX path of targetFile
	  set shellCommand to "nohup /usr/local/bin/wezterm start --always-new-process /usr/local/bin/nvim " & quoted form of targetFile & " > /dev/null 2>&1 &"
	  do shell script "/usr/local/bin/zsh -c " & quoted form of shellCommand
	end repeat

	delay 0.5
	tell application "WezTerm" to activate
  end if
end run
