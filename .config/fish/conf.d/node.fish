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
abbr --add --global np 'npm'
abbr --add --global npi 'npm install'
abbr --add --global npr 'npm run'
# pnpm
abbr --add --global pn 'pnpm'
abbr --add --global pni 'pnpm install'
abbr --add --global pnr 'pnpm run'
abbr --add --global pnx 'pnpm exec'

# ↓ Added by `pnpm install-completion`
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
