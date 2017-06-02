# set editor and pager
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL=vim
export EDITOR=vim

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Golang environment
export GOPATH=$HOME/Work/golang

# libraries
if [[ $IS_LINUX -eq 1 ]]; then
    export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
fi

export PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH
