# initialize path
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# setup terminal
export TERM=rxvt-unicode

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

# LaTeX
export PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH
export INFOPATH=/usr/local/texlive/2013/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2013/texmf-dist/doc/man:/usr/local/man:/usr/local/share/man:/usr/share/man

# python virtual envirinoment setup
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh 
