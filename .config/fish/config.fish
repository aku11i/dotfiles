# Fisherman - Plugin Manager
[ ! -f ~/.config/fish/functions/fisher.fish ]; and curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

## Environment

# Data Folder
set -g DATA_DIR $HOME/data

# Android
if [ (uname) = "Darwin" ]
  if test -d $HOME/Library/Android/sdk
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $ANDROID_HOME/platform-tools $PATH
  end
end

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

# PHP Composer
if test -d $HOME/.composer/vendor/bin
  set -x PATH $HOME/.composer/vendor/bin $PATH
end

if [ (uname) = "Linux" ]
  # Linuxbrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -x INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
  set -x XDG_DATA_DIRS /home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS
end

set -x EDITOR 'nvim'

# jethrokuan/fzf
set -x FZF_LEGACY_KEYBINDINGS 1
which rg > /dev/null 2>&1 && set -x FZF_DEFAULT_COMMAND  'rg --files'

# Bobthefish Theme
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_git_worktree_support no
set -g theme_display_vagrant yes
set -g theme_display_virtualenv yes
set -g theme_display_ruby yes
set -g theme_display_user no
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_color_scheme solarized
set -g fish_prompt_pwd_dir_length 2
set -g theme_project_dir_length 1
set -g theme_newline_cursor no

# Node Version Manager
set -x NVM_DIR "$HOME/.nvm"
[ ! -d "$NVM_DIR" ]; and curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

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
function mkcd --description "mkdir & cd"
  [ ! -d $argv ]; and mkdir -p $argv
  cd $argv
end

function cd
  builtin cd $argv
  ls -a
end

function data --description "mkdir & cd ~/$DATA_DIR/YYYY/MM/DD"
  set now (date "+%Y/%m/%d")
  if test ! -s $DATA_DIR
    mkdir $DATA_DIR
    set mkdir_status $status
    test $mkdir_status -ne 0; and return $mkdir_status
  end

  if test ! -s $DATA_DIR/$now
    mkdir -p $DATA_DIR/$now
    set mkdir_status $status
    test $mkdir_status -ne 0; and return $mkdir_status
  end

  echo $DATA_DIR/$now
  cd $DATA_DIR/$now
end

abbr d 'data'

# open commands
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

# Docker for Windows
if [ (uname -a | grep "Microsoft") ]
  abbr docker docker.exe
  abbr docker-compose docker-compose.exe
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
abbr gcf 'git commit --file'
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

abbr gC 'git config'
abbr gCun 'git config user.name'
abbr gCum 'git config user.email'

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

# Vagrant
abbr vgi 'vagrant init'
abbr vgs 'vagrant status'
abbr vgu 'vagrant up'
abbr vgr 'vagrant reload'
abbr vgh 'vagrant halt'
abbr vgS 'vagrant ssh'
abbr vgp 'vagrant provision'
abbr vgd 'vagrant destroy'

# Translate Shell
abbr tre 'trans --no-warn --brief :en'
abbr trj 'trans --no-warn --brief :ja'
