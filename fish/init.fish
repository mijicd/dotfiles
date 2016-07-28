#
# Z setup for Mac and Linux
#
if test (uname) == Darwin
    set -gx Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
else
    set -gx Z_SCRIPT_PATH $OMF_CONFIG/z.sh
end

#
# Java resolver
#
function jhome
    set -gx JAVA_HOME (/usr/libexec/java_home $argv)
end

#
# Exports
#
set -gx LESS '--ignore-case --raw-control-chars'
set -gx PAGER 'less'
set -gx VISUAL vim
set -gx EDITOR vim
set -gx LC_COLLATE C
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx GOPATH $HOME/Desktop/gophers

alias vi 'vim'
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
