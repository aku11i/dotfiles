# Node.js

# fnm (Fast Node Manager)
if test (which fnm)
  # Load
  fnm env | source

  if test -e ./.nvmrc; or test -e ./.node-version
    # Switch the node version to specified by .nvmrc
    fnm use --install-if-missing > /dev/null
  end
end

# Aliases
abbr --add --global npr 'npm run'
# pnpm
abbr --add --global pn 'pnpm'
abbr --add --global pni 'pnpm install'
abbr --add --global pnr 'pnpm run'
abbr --add --global pnx 'pnpm exec'
