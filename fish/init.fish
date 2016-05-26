#
# Z setup for Mac and Linux
#
if test (uname) == Darwin
    set -gx Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
else
    set -gx Z_SCRIPT_PATH $OMF_CONFIG/z.sh
end

#
# Exports
#
set -g -x LESS '--ignore-case --raw-control-chars'
set -g -x PAGER 'less'
set -g -x VISUAL nvim
set -g -x EDITOR nvim
set -g -x LC_COLLATE C
set -g -x LC_ALL en_US.UTF-8
set -g -x LANG en_US.UTF-8

alias vi nvim
alias l 'ls -la'

#
# Git
#
alias ga 'git add'
alias gs 'git status'
alias gc 'git commit -m'
alias gca 'git commit --amend'
alias gl 'git log'
alias gb 'git branch'
alias gco 'git checkout'
alias gcb 'git checkout -b'
alias gri 'git rebase -i'
alias gcl 'git clone'
alias gp 'git push'
alias gpu 'git pull --rebase'
alias gd 'git diff'
alias gdt 'git difftool'
alias gm 'git merge'
alias gms 'git merge --squash'
alias gmf 'git merge --no-ff'
alias gmt 'git mergetool'
