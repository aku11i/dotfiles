# open
if test (uname -a | grep --ignore-case "Microsoft")
  abbr --add --global cmd 'cmd.exe /c'
  set WINDOWS_OPEN 'cmd.exe /c start'
  abbr --add --global start $WINDOWS_OPEN
  abbr --add --global open $WINDOWS_OPEN
  abbr --add --global o $WINDOWS_OPEN
else if test (uname) = "Linux"
  set LINUX_OPEN 'xdg-open 2>/dev/null'
  abbr --add --global open $LINUX_OPEN
  abbr --add --global o $LINUX_OPEN
else
  abbr --add --global o 'open'
end
