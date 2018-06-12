# set editor and pager
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL=vim
export EDITOR=vim

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# environments
export STACKPATH=$HOME/.local

export PATH=$STACKPATH/bin:$PATH
