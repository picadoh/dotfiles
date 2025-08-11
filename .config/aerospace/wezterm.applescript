set appName to "WezTerm"
set appCmd to "/Applications/WezTerm.app/Contents/MacOS/wezterm-gui"

if application appName is running then
  Do Shell Script appCmd
else
  tell application appName to activate
end if
