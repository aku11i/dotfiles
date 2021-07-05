abbr --add --global l 'ls -1a'
abbr --add --global la 'ls -a'
abbr --add --global ll 'ls -lha'

if which lsd > /dev/null
  abbr --add --global ls 'lsd'
  abbr --add --global l 'lsd -1a'
  abbr --add --global la 'lsd -a'
  abbr --add --global ll 'lsd -lha'
end

abbr --add --global cp 'cp -ir'
abbr --add --global mv 'mv -i'
abbr --add --global mkdir 'mkdir -p'
abbr --add --global rm 'rm -i'

abbr --add --global tree 'tree -N'
