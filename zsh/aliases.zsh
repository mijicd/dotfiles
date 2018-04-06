# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lh='ls -d .*' # show hidden files/directories only
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format
alias l='ls -al'

# Git
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gp='git push'
alias gpu='git pull --rebase'
alias gd='git diff'
alias gm='git merge'
alias gms='git merge --squash'
alias gmf='git merge --no-ff'
alias gmt='git mergetool'

# utilities
alias ensime='ctags -R . & sbt clean ensimeConfig test:compile ensimeServerIndex'
alias vi=vim
