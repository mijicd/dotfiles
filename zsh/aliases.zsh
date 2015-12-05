
# substitute vi with vim
alias vi=vim
# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------
alias lh='ls -d .*' # show hidden files/directories only
alias lsd='ls -aFhlG'
alias l='ls -al'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dus=du -sckx * | sort -nr' #directories sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------

# committing
alias ga='git add'
alias gs='git status'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gta='git tag -a -m'

# logs
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias grl='git reflog'

# branches
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'
alias gr='git rebase'
alias gri='git rebase -i'

# remotes
alias gcl='git clone'
alias gp='git push'
alias gpu='git pull --rebase'
alias gra='git remote add'
alias grr='git remote rm'

# diff & merge
alias gd='git diff'
alias gdt='git difftool'
alias gm='git merge'
alias gms='git merge --squash'
alias gmf='git merge --no-ff'
alias gmt='git mergetool'
