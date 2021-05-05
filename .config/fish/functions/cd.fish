abbr .. 'cd ../'
abbr ... 'cd ../../'
abbr .... 'cd ../../../'
abbr ..... 'cd ../../../../'

function cd -d "Overrides builtin cd command"
  builtin cd $argv
  ls -a

  if test -e ./.nvmrc
    # Switch the node version to specified by .nvmrc
    fnm use --install-if-missing
  end
end
