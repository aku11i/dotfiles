# Node.js

# fnm (Fast Node Manager)
if test (which fnm)
  # Load
  fnm env | source

  if test -f .nvmrc
    # Switch the node version to specified by .nvmrc
    fnm use --install-if-missing > /dev/null
  end
end

# Aliases
abbr --add --global npr 'npm run'
