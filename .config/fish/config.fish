# Fisherman - Plugin Manager
[ ! -f ~/.config/fish/functions/fisher.fish ]; and curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

## Environment

# Go
if test -d $HOME/.go
  set -x GOPATH $HOME/.go
  set -x PATH $GOPATH/bin $PATH
end

# Flutter
if test -d $HOME/tools/flutter
  set -x PATH $HOME/tools/flutter/bin $PATH
end

# Rust
if test -d $HOME/.cargo
  set -x PATH $HOME/.cargo/bin $PATH
end

if [ (uname) = "Linux" ]
  # Linuxbrew
  set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -gx MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -gx INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
  set -gx XDG_DATA_DIRS /home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS
end

# Bobthefish Theme
# set -g theme_display_git no
# set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
# set -g theme_display_vagrant yes
# set -g theme_display_virtualenv no
# set -g theme_display_ruby no
# set -g theme_display_user yes
# set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_color_scheme solarized
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes

# Node Version Manager
set -g NVM_DIR "$HOME/.nvm"
[ ! -d "$NVM_DIR" ]; and curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Auto Start Tmux
# if [ -z "$TMUX" -a -z "$STY" ]
#   which tmux > /dev/null ;and tmux new-session -t "General" ;and exit # 'exit' may not close fish
# end


## Aliases

# Global(like) Aliases
abbr G 'grep'
abbr L 'less'
abbr A 'awk'
abbr S 'sed'
abbr T 'tail'
abbr C 'cat'
abbr V 'vim -'
abbr NV 'nvim -'

# Util
abbr l 'ls -1a'
abbr la 'ls -a'
abbr l1 'ls -1a'
abbr ll 'ls -lha'

abbr rm 'rm -i'
abbr cp 'cp -ir'
abbr mv 'mv -i'

alias ... 'cd ../../'
alias .... 'cd ../../../'
alias ..... 'cd ../../../../'

[ which trash >/dev/null 2>&1 ] ;and abbr del 'trash -r'

abbr mkdir 'mkdir -p'
function mkcd
  [ ! -d $argv ]; and mkdir -p $argv
  cd $argv
end

function cd
  builtin cd $argv
  ls -a
end


if [ (uname -a | grep "Microsoft") ]
  abbr cmd 'cmd.exe /c'
  set WINDOWS_OPEN 'cmd.exe /c start'
  abbr start $WINDOWS_OPEN
  abbr open $WINDOWS_OPEN
  abbr o $WINDOWS_OPEN
else if [ (uname) = "Linux" ]
  set LINUX_OPEN 'xdg-open 2>/dev/null'
  abbr open $LINUX_OPEN
  abbr o $LINUX_OPEN
else
  abbr o 'open'
end


# Vim
abbr v 'vi'
abbr vi 'nvim'

## macOS Apps
if [ (uname) = 'Darwin' ]
  # Xcode
  abbr xcode 'open -a /Applications/Xcode.app'
  abbr xc731 'open -a /Applications/Xcode\ 7.3.1.app'
  abbr xc7 'open -a /Applications/Xcode\ 7.3.1.app'
  # iA Writer
  abbr ia 'open -a /Applications/iA\ Writer.app'
  # Yoink
  abbr yoink 'open -a Yoink'
end

# Subversion
abbr s 'svn'
abbr sb 'svn branch'
abbr svu 'svn update'
abbr svt 'svn status'
abbr svl 'svn log -l 5'
abbr svd 'svn diff'
abbr sc 'svn commit'
abbr scm 'svn commit -m'


# Git
abbr g 'git'

abbr gf 'git fetch'

abbr gis 'git status --short --branch'
abbr grh 'git reset HEAD'

abbr gl 'git log --graph --decorate --oneline'
abbr glf 'git log --graph --decorate --oneline -p --follow'


abbr gia 'git add'
abbr giA 'git add --patch'

abbr gid 'git diff'
abbr gd 'git diff'
abbr gdc 'git diff --cached'

abbr gco 'git checkout'
abbr gcb 'git checkout -b'

abbr gc 'git commit'
abbr gcm 'git commit -m'
abbr gca 'git commit --amend'

abbr gp 'git push'
abbr gpf 'git push --force'
abbr gpa 'git push --all'
abbr gpA 'git push --all; and git push --tags'
abbr gpt 'git push --tags'
abbr gpT 'git push ;and git push --tags'
abbr gpu 'git push --set-upstream origin HEAD'

abbr gP 'git pull'

abbr gPp 'git pull ;and git push'

abbr gb 'git branch'
abbr gbc 'git symbolic-ref --short HEAD' # git branch current
abbr gbl 'git branch --list'
abbr gbr 'git branch --remotes'
abbr gbd 'git branch --delete'
abbr gbD 'git branch -D'  # force delete

abbr gr 'git rebase'
abbr grm 'git rebase master'

abbr gR 'git remote'
abbr gRl 'git remote --verbose'
abbr gRa 'git remote add'
abbr gRA 'git remote add origin'
abbr gRs 'git remote show'

abbr gm 'git merge'
abbr gmt 'git mergetool'
abbr gmn 'git merge --no-ff --no-commit'

abbr gcf 'git config'
abbr gcfun 'git config user.name'
abbr gcfum 'git config user.email'

# Git Flow
abbr gF 'git flow'
abbr gFi 'git flow init'
abbr gFf 'git flow feature'
abbr gFfs 'git flow feature start'
abbr gFff 'git flow feature finish'
abbr gFr 'git flow release'
abbr gFrs 'git flow release start'
abbr gFrf 'git flow release finish'
abbr gFh 'git flow hotfix'
abbr gFhs 'git flow hotfix start'
abbr gFhf 'git flow hotfix finish'
abbr gFs 'git flow support'
abbr gFss 'git flow support start'
abbr gFsf 'git flow support finish'

# Git Stash
abbr gs 'git stash'
abbr gsS 'git stash save'
abbr gsp 'git stash pop'
abbr gsa 'git stash apply'
abbr gsl 'git stash list'
abbr gss 'git stash show'
abbr gsb 'git stash branch'
abbr gsc 'git stash create'
abbr gsC 'git stash clear'
abbr gsd 'git stash drop'

# Git Cherry Pick
abbr gck 'git cherry-pick'

# Git SVN
abbr gS 'git svn'
abbr gSm 'git merge --no-ff --no-commit'
abbr gSr 'git svn rebase'
abbr gSd 'git svn dcommit'
abbr gSl 'git svn log'

# tmux
abbr t 'tmux'
abbr ta 'tmux attach'
abbr td 'tmux detach'
abbr tn 'tmux new-session -t'
abbr tN 'tmux detach; and tmux new-session -t'
abbr tk 'tmux kill-session -t'
abbr tK 'tmux kill-server'
abbr tl 'tmux ls'
abbr ts 'tmux switch-client -t'
