# initialize path
PATH=/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$PATH

# grep colors
# export GREP_OPTIONS='--color=auto'
# export GREP_COLOR='3;33'

# set editor and pager
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL=vim
export EDITOR=vim

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# python virtual envirinoment setup
export WORKON_HOME=$HOME/.virtualenvs
[[ -s "/usr/bin/virtualenvwrapper.sh" ]] && source /usr/bin/virtualenvwrapper.sh 
# start rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# libraries
if [[ $IS_LINUX -eq 1 ]]; then
    export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
fi
