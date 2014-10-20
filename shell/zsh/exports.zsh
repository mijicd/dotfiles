# initialize path
PATH=/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$PATH

# grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# set editor and pager
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL=vim
export EDITOR=vim

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

# locale settings
export LANG=en_US.UTF-8
export LC_MESSAGES="C"

# python virtual envirinoment setup
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh 
