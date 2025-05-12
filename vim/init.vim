" Forget compatibility with vi. Who cares.
set nocompatible

" load plugin manager
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" load bundles
if filereadable(expand("~/.dotfiles/vim/bundles.vim"))
  source ~/.dotfiles/vim/bundles.vim
endif

" Leaders
let mapleader = " "
let maplocalLeader = "\\"

" timeouts
set timeout timeoutlen=1000 ttimeoutlen=500

set laststatus=2                  " always show the status line
set cmdheight=2                   " and use a two-line tall status line
set showcmd                       " show the command
set noshowmode                    " don't show the mode, vim-airline will do that for us
set autoindent                    " turns it on
set smartindent                   " does the right thing (mostly) in programs
set linespace=3                   " prefer a slight higher line height
set linebreak                     " wrap intelligently, won't insert hard line breaks
set wrap                          " use line wrapping
set textwidth=79                  " at column 79
set ruler                         " display current cursor position
set showmatch                     " show matching brackets
set showtabline=0                 " disable tabline
if exists("&relativenumber")
  set relativenumber              " use relative line numbers
endif
set number                        " except for the current line - absolute number there
set backspace=indent,eol,start    " make backspace behave in a sane manner
set mousehide                     " hide mouse when typing
set foldenable                    " enable code folding
set history=1000
set ffs=unix,mac,dos              " default file types
set autoread                      " automatically update file when editted outside of vim
set completeopt=menu              " don't show any previews

" Setup automatic text formatting/wrapping (previously: grn1)
set formatoptions=
set formatoptions-=t              " don't autowrap text
set formatoptions+=c              " do autowrap comments
set formatoptions+=r              " automatically continue comments
set formatoptions+=o              " automatically continue comments when hitting 'o' or 'O'
set formatoptions+=q              " allow formating of comments with 'gq'
set formatoptions+=n              " recognize numbered lists
set formatoptions+=l              " don't break long lines that were already there

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" use <C>hjkl to switch between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Move line(s) up or down via C-j and C-k respectively
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" encoding
set encoding=utf-8

" encryption
if exists("&cryptmethod")
  set cryptmethod=blowfish
endif

" What to do with files and focus
set autowrite           " write out old file when switching between files
set autoread            " reload files changed on disk, i.e. via `git checkout`
au FocusLost * :wa      " save file when Vim loses focus
set hidden              " switch beteen buffers without saving

" Disable backups
set nobackup
set noswapfile

" Tabs
set tabstop=4           " 4 spaces for a tab
set shiftwidth=4        " 4 spaces for autoindenting
set softtabstop=4       " when <BS>, pretend a tab is removed even if spaces
set expandtab           " expand tabs to spaces (overloadable by file type)

" Scrolling
set scrolloff=5         " show context above/below cursor line
set sidescrolloff=10    " number of cols from horizontal edge to  start scrolling
set sidescroll=1        " number of cols to scroll at a time

" sudo to write
cmap w!! w !sudo tee % >/dev/null

" toggle listchars on or off
noremap <Leader>i :set list!<CR>

" Better pasting from clipboard
" http://tilvim.com/2014/03/18/a-better-paste.html
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

set clipboard=unnamed   " yank and paste with the system clipboard

if has("autocmd")
  filetype plugin indent on

  " show cursorline only in active window
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

" Map escape to fd
imap fd <esc>
vmap fd <esc>

" Searching
set incsearch           " use incremental search
set hlsearch            " highlight search results
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search string is all lower case, case-sensitve otherwise
                        " remove search highlighting with <F3>

" Splits
nnoremap <Leader>v <C-w>v<C-w>l   " open a vertical split and switch to it (,v)
nnoremap <Leader>h <C-w>s<C-w>j   " open a horizontal split and switch to it (,h)

" Command line completion
set wildmenu
set wildmode=full

" control whitespace preferences based on filetype
if has("autocmd")
  " enable file type detection
  filetype on

  " prevent Vim from auto-inserting comment on subsequent lines
  " http://tilvim.com/2013/12/30/remove-comment-prefix-2.html
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o

  " syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " spell check Git commit messages
  autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us

  " start commit message in insert mode
  autocmd BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')

  " markdown files
  autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setfiletype markdown
  autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
  autocmd FileType markdown setlocal tw=100

  " Python files
  let NERDTreeIgnore = ['\.pyc$', '\~$', '\.rbc$']
  autocmd BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 expandtab
endif
