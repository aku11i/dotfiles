# FZF
set -x FZF_LEGACY_KEYBINDINGS 1
if test -e ""(which rg)
  set -x FZF_DEFAULT_COMMAND  'rg --files --hidden'
end
