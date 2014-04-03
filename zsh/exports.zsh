# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
export PATH=$PATH~/bin:/usr/local/bin:/usr/local/sbin:~/bin

# Set default console Java to 1.6
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

# setup terminal, and turn on colors
#export TERM=urxvt
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
#export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL=vim
export EDITOR=vim

#export NODE_PATH=/opt/github/homebrew/lib/node_modules
#export PYTHONPATH=/usr/local/lib/python2.6/site-packages
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

#export GH_ISSUE_CREATE_TOKEN=083f60c674d8eb41f98258df9fc8d94cb733218a

# LaTeX
export PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH
export INFOPATH=/usr/local/texlive/2013/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2013/texmf-dist/doc/man:/usr/local/man:/usr/local/share/man:/usr/share/man

# python virtual envirinoment setup
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh 
