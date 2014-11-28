# substitue vi with vim
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
# Mercurial (hg)
# -------------------------------------------------------------------
alias 'h=hg status'
alias 'hc=hg commit'
alias 'push=hg push'
alias 'pull=hg pull'
alias 'clone=hg clone'

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

# -------------------------------------------------------------------
# pacaur
# -------------------------------------------------------------------

# installation & update
alias aurin='pacaur -S'
alias aurupg='pacaur -Syu'

# package info
alias aurinfo='pacaur -Si'

# package search
alias aurfind='pacaur -Ss'

# -------------------------------------------------------------------
# pacman
# -------------------------------------------------------------------

# installation & update
alias pacin='sudo pacman -S'
alias paclin='sudo pacman -U'
alias paclf="pacman -Ql"
alias pacupg='sudo pacman -Syu'

# package & cache removal
alias pacrem='sudo pacman -Rns'
alias pacc="sudo pacman -Scc"

# package info
alias pacinfo='pacman -Si'
alias paclinfo='pacman -Qi'

# package search
alias pacfind='pacman -Ss'
alias paclfind='pacman -Qs'

# orphans management (list & remove)
alias paclo="pacman -Qdt"
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;\$!ba;s/\n/ /g')"

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
