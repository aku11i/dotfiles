# Fisher - Plugin Manager
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

## Environment

# Data Folder
set -g DATA_DIR $HOME/data

# Android
if test (uname) = "Darwin"
  if test -d $HOME/Library/Android/sdk
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
  end
else if test (uname) = "Linux"
  if test -d $HOME/tools/android-sdk
    set -x ANDROID_HOME $HOME/tools/android-sdk
    set -x PATH $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
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

if test (uname) = "Linux"
  # Linuxbrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
  set -x MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -x INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
  set -x XDG_DATA_DIRS /home/linuxbrew/.linuxbrew/share $XDG_DATA_DIRS
end

set -x EDITOR 'nvim'

# jethrokuan/fzf
set -x FZF_LEGACY_KEYBINDINGS 1
if test -e ""(which rg)
  set -x FZF_DEFAULT_COMMAND  'rg --files'
end

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

# Auto Start Tmux
# if [ -z "$TMUX" -a -z "$STY" ]
#   which tmux > /dev/null ;and tmux new-session -t "General" ;and exit # 'exit' may not close fish
# end


## Aliases

# Util
abbr --add --global l 'ls -1a'
abbr --add --global la 'ls -a'
abbr --add --global l1 'ls -1a'
abbr --add --global ll 'ls -lha'

abbr --add --global rm 'rm -i'
abbr --add --global cp 'cp -ir'
abbr --add --global mv 'mv -i'

alias ... 'cd ../../'
alias .... 'cd ../../../'
alias ..... 'cd ../../../../'

abbr --add --global mkdir 'mkdir -p'
function mkcd --description "mkdir & cd"
  test ! -d "$argv"; and mkdir -p $argv
  cd $argv
end

function cd
  builtin cd $argv
  ls -a

  # Switch Node version if .nvmrc exists
  if test -e ./.nvmrc
    nvm
    echo
    echo "Node.js: "(node -v)
    echo "NPM    : "(npm -v)
  end
end

function data --description "mkdir & cd ~/$DATA_DIR/YYYY/MM/DD"
  set now (date "+%Y/%m/%d")
  if test ! -s "$DATA_DIR/$now"
    mkdir -p $DATA_DIR/$now
    set mkdir_status $status
    test $mkdir_status -ne 0; and return $mkdir_status
  end

  echo $DATA_DIR/$now
  cd $DATA_DIR/$now
end

abbr --add --global d 'data'

# open commands
if test (uname -a | grep "Microsoft")
  abbr --add --global cmd 'cmd.exe /c'
  set WINDOWS_OPEN 'cmd.exe /c start'
  abbr --add --global start $WINDOWS_OPEN
  abbr --add --global open $WINDOWS_OPEN
  abbr --add --global o $WINDOWS_OPEN
else if test (uname) = "Linux"
  set LINUX_OPEN 'xdg-open 2>/dev/null'
  abbr --add --global open $LINUX_OPEN
  abbr --add --global o $LINUX_OPEN
else
  abbr --add --global o 'open'
end

# Docker for Windows
if test (uname -a | grep "Microsoft")
  abbr --add --global docker docker.exe
  abbr --add --global docker-compose docker-compose.exe
end


# Vim
abbr --add --global v 'vi'
abbr --add --global vi 'nvim'

## macOS Apps
if test (uname) = 'Darwin'
  # Xcode
  abbr --add --global xcode 'open -a /Applications/Xcode.app'
  abbr --add --global xc731 'open -a /Applications/Xcode\ 7.3.1.app'
  abbr --add --global xc7 'open -a /Applications/Xcode\ 7.3.1.app'
  # iA Writer
  abbr --add --global ia 'open -a /Applications/iA\ Writer.app'
  # Yoink
  abbr --add --global yoink 'open -a Yoink'
end

# Subversion
abbr --add --global s 'svn'
abbr --add --global sb 'svn branch'
abbr --add --global svu 'svn update'
abbr --add --global svt 'svn status'
abbr --add --global svl 'svn log -l 5'
abbr --add --global svd 'svn diff'
abbr --add --global sc 'svn commit'
abbr --add --global scm 'svn commit -m'


# Git
abbr --add --global g 'git'

abbr --add --global gf 'git fetch'
abbr --add --global gfp 'git fetch --prune'

abbr --add --global gs 'git status --short --branch'
abbr --add --global gr 'git reset'
abbr --add --global grh 'git reset --hard'

abbr --add --global gl 'git log --graph --decorate --oneline'
abbr --add --global glf 'git log --graph --decorate --oneline -p --follow'

abbr --add --global ga 'git add'
abbr --add --global gA 'git add .'
abbr --add --global gap 'git add --patch'

abbr --add --global gd 'git diff'
abbr --add --global gdc 'git diff --cached'

abbr --add --global gsw 'git switch'
abbr --add --global gsc 'git switch --create'
abbr --add --global gsC 'git switch --force-create'

abbr --add --global gco 'git checkout'

abbr --add --global gc 'git commit'
abbr --add --global gcm 'git commit -m'
abbr --add --global gcf 'git commit --file'
abbr --add --global gcF 'git commit --file -'
abbr --add --global gca 'git commit --amend'

abbr --add --global gp 'git push'
abbr --add --global gpf 'git push --force'
abbr --add --global gpt 'git push --tags'
abbr --add --global gpT 'git push ;and git push --tags'
abbr --add --global gpu 'git push --set-upstream origin HEAD'

abbr --add --global gP 'git pull'
abbr --add --global gPp 'git pull ;and git push'

abbr --add --global gb 'git branch'
abbr --add --global gbc 'git symbolic-ref --short HEAD' # git branch current
abbr --add --global gbl 'git branch --list'
abbr --add --global gbr 'git branch --remotes'
abbr --add --global gbd 'git branch --delete'
abbr --add --global gbD 'git branch --delete --force'

abbr --add --global gR 'git rebase'
abbr --add --global gRm 'git rebase master'

abbr --add --global gm 'git merge'
abbr --add --global gmt 'git mergetool'
abbr --add --global gmn 'git merge --no-ff --no-commit'

abbr --add --global gC 'git config'
abbr --add --global gCun 'git config user.name'
abbr --add --global gCum 'git config user.email'

# Git Flow
abbr --add --global gF 'git flow'
abbr --add --global gFi 'git flow init'
abbr --add --global gFf 'git flow feature'
abbr --add --global gFfs 'git flow feature start'
abbr --add --global gFff 'git flow feature finish'
abbr --add --global gFr 'git flow release'
abbr --add --global gFrs 'git flow release start'
abbr --add --global gFrf 'git flow release finish'
abbr --add --global gFh 'git flow hotfix'
abbr --add --global gFhs 'git flow hotfix start'
abbr --add --global gFhf 'git flow hotfix finish'
abbr --add --global gFs 'git flow support'
abbr --add --global gFss 'git flow support start'
abbr --add --global gFsf 'git flow support finish'

# Git Stash
abbr --add --global gS 'git stash'
abbr --add --global gSs 'git stash save'
abbr --add --global gSp 'git stash pop'
abbr --add --global gSa 'git stash apply'
abbr --add --global gSl 'git stash list'
abbr --add --global gSs 'git stash show'
abbr --add --global gSb 'git stash branch'
abbr --add --global gSc 'git stash create'
abbr --add --global gSC 'git stash clear'
abbr --add --global gSd 'git stash drop'

# Git Cherry Pick
abbr --add --global gcp 'git cherry-pick'

# Git SVN
abbr --add --global gSV 'git svn'
abbr --add --global gSVm 'git merge --no-ff --no-commit'
abbr --add --global gSVr 'git svn rebase'
abbr --add --global gSVd 'git svn dcommit'
abbr --add --global gSVl 'git svn log'

# tmux
abbr --add --global t 'tmux'
abbr --add --global ta 'tmux attach'
abbr --add --global td 'tmux detach'
abbr --add --global tn 'tmux new-session -t'
abbr --add --global tN 'tmux detach; and tmux new-session -t'
abbr --add --global tk 'tmux kill-session -t'
abbr --add --global tK 'tmux kill-server'
abbr --add --global tl 'tmux ls'
abbr --add --global ts 'tmux switch-client -t'

# Vagrant
abbr --add --global vgi 'vagrant init'
abbr --add --global vgs 'vagrant status'
abbr --add --global vgu 'vagrant up'
abbr --add --global vgr 'vagrant reload'
abbr --add --global vgh 'vagrant halt'
abbr --add --global vgS 'vagrant ssh'
abbr --add --global vgp 'vagrant provision'
abbr --add --global vgd 'vagrant destroy'

# Translate Shell
abbr --add --global tre 'trans --no-warn --brief :en'
abbr --add --global trj 'trans --no-warn --brief :ja'

## Global Aliases
if functions -q gabbr
  gabbr A '; and'
  gabbr O '; or'
  gabbr G '| grep'
  gabbr H '| head'
  gabbr T '| tail'
  gabbr L '| less'
  gabbr V '| nvim -'
  gabbr J '| jq'
  gabbr F '| fx'
end
