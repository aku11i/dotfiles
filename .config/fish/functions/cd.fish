abbr .. 'cd ../'
abbr ... 'cd ../../'
abbr .... 'cd ../../../'
abbr ..... 'cd ../../../../'

function cd -d "Overrides builtin cd command"
  builtin cd $argv

  if which lsd > /dev/null
    lsd -a
  else
    ls -a
  end
end
