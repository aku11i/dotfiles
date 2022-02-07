# Aliases

# Git
abbr --add --global g 'git'

abbr --add --global gf 'git fetch'
abbr --add --global gfp 'git fetch --prune'

abbr --add --global gs 'git status --short --branch'

abbr --add --global gl 'git log --oneline -10'

abbr --add --global gR 'git reset'
abbr --add --global gRH 'git reset HEAD'
abbr --add --global gR1 'git reset HEAD~1'
abbr --add --global gR2 'git reset HEAD~2'
abbr --add --global gR3 'git reset HEAD~3'
abbr --add --global gR4 'git reset HEAD~4'
abbr --add --global gR5 'git reset HEAD~5'

abbr --add --global gg 'git log --graph --decorate --oneline'
abbr --add --global ggf 'git log --graph --decorate --oneline -p --follow'

abbr --add --global ga 'git add'
abbr --add --global ga. 'git add .'
abbr --add --global gap 'git add --patch'

abbr --add --global gd 'git diff'
abbr --add --global gdc 'git diff --cached'

if which delta > /dev/null
  abbr --add --global gd 'git diff | delta'
  abbr --add --global gdc 'git diff --cached | delta'
end

abbr --add --global gsw 'git switch'
abbr --add --global gsc 'git switch --create'
abbr --add --global gsC 'git switch --force-create'

abbr --add --global gco 'git checkout'

abbr --add --global gr 'git rebase'
abbr --add --global gri 'git rebase --interactive'
abbr --add --global grc 'git rebase --continue'
abbr --add --global gra 'git rebase --abort'

abbr --add --global gc 'git commit'
abbr --add --global gcm 'git commit -m'
abbr --add --global gcf 'git commit --file'
abbr --add --global gcF 'git commit --file -'
abbr --add --global gca 'git commit --amend'

abbr --add --global gp 'git push'
abbr --add --global gpf 'git push --force'
abbr --add --global gpt 'git push --tags'
abbr --add --global gpT 'git push --follow-tags'
abbr --add --global gpu 'git push --set-upstream origin HEAD'

abbr --add --global gP 'git pull'
abbr --add --global gPp 'git pull ;and git push'

abbr --add --global gb 'git branch'
abbr --add --global gbc 'git symbolic-ref --short HEAD' # git branch current
abbr --add --global gbl 'git branch --list --sort=-authordate'
abbr --add --global gbr 'git branch --remotes --sort=-authordate'
abbr --add --global gbd 'git branch --delete'
abbr --add --global gbD 'git branch --delete --force'
abbr --add --global gbm 'git branch --move'

abbr --add --global gR 'git rebase'
abbr --add --global gRm 'git rebase master'

abbr --add --global gm 'git merge'
abbr --add --global gmt 'git mergetool'
abbr --add --global gmn 'git merge --no-ff --no-commit'
abbr --add --global gma 'git merge --abort'

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

# FZF combination
function ghf
  if test "$argv" = "pr checkout"
    gh pr checkout (gh pr list | fzf | awk '{print $1}')
    return
  end
end

