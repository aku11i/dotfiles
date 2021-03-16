abbr .. 'cd ../'
abbr ... 'cd ../../'
abbr .... 'cd ../../../'
abbr ..... 'cd ../../../../'

function cd -d "Overrides buildin cd command"
  builtin cd $argv
  ls -a

  if test -e ./.nvmrc
    # Switch node version
    fnm use --install-if-missing
    echo
    echo "Node.js: "(node -v)
    echo "npm    : "(npm -v)
  end
end
