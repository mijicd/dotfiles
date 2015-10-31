" Thanks to Mark Nichols <mark@zanshin.net>

" -------------------------------------------------------------------
" Forget compatibility with vi. Who cares.
" -------------------------------------------------------------------
set nocompatible

" -------------------------------------------------------------------
" Get SID prefix of vimrc (see :h <SID>)
" -------------------------------------------------------------------
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_')
endfunction

" -------------------------------------------------------------------
" setup Vundle to manage plugins
" -------------------------------------------------------------------
" turn filetype on so that we can turn if off without generating an exit code
" of 1 when quiting vim.
filetype on                     " best to have it on before turning it off
filetype off                    " needs to be off to setup Vundle
set rtp+=~/.vim/bundle/vundle/  " add vundle to run time path
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" look & feel, core vi
Bundle 'bling/vim-airline'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'rking/ag.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'luochen1990/rainbow'

" editing utilities
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'editorconfig/editorconfig-vim'

" vim-snipmate requires vim-addon-mw-utils and tlib_vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "tomtom/tcomment_vim"
Bundle "garbas/vim-snipmate"

" Some snippets to get started
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"

if has('autocmd')
  filetype plugin indent on    " enable plugins, detection and indenting
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

" gVim settings
if has('gui_running')
    " set font
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata-g\ for\ Powerline:h14
    endif

    " remove bars
    set guioptions-=m   " remove menu bar
    set guioptions-=T   " remove toolbar
    set guioptions-=r   " remove right-hand scroll bar
    set guioptions-=L   " remove left-hand scroll bar
endif

" -------------------------------------------------------------------
"  change leaders
"  ------------------------------------------------------------------
:let mapleader = ","
:let maplocalleader = "\\"

" -------------------------------------------------------------------
" Allow saving of files as sudo when I forgot to start vim using sudo.
" -------------------------------------------------------------------
cmap w!! w !sudo tee > /dev/null %

" -------------------------------------------------------------------
" time out mappings after 1 second (1000)
" and key codes after 1/2 a second (500)
" -------------------------------------------------------------------
set timeout timeoutlen=1000 ttimeoutlen=500

" -------------------------------------------------------------------
" Trying to break a very old habit...
" ex mode commands made easy
" -------------------------------------------------------------------
nnoremap ; :
nnoremap Q <nop>

" -------------------------------------------------------------------
" basic options
" -------------------------------------------------------------------
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

" Setup automatic text formatting/wrapping (previously: grn1 )
set formatoptions=
set formatoptions-=t              " don't autowrap text
set formatoptions+=c              " do autowrap comments
set formatoptions+=r              " automatically continue comments
set formatoptions+=o              " automatically continue comments when hitting 'o' or 'O'
set formatoptions+=q              " allow formating of comments with 'gq'
set formatoptions+=n              " recognize numbered lists
set formatoptions+=l              " don't break long lines that were already there

" -------------------------------------------------------------------
" Navigation and movement
" -------------------------------------------------------------------
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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -------------------------------------------------------------------
" Move line(s) up or down via C-j and C-k respectively
" -------------------------------------------------------------------
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" -------------------------------------------------------------------
" Encoding anyone?
" -------------------------------------------------------------------
set termencoding=utf-8  " we like utf-8
set encoding=utf-8

" -------------------------------------------------------------------
" Encryption settings
" -------------------------------------------------------------------
set cryptmethod=blowfish " Strong encryption is good

" -------------------------------------------------------------------
" What to do with files and focus
" -------------------------------------------------------------------
set autowrite           " write out old file when switching between files
set autoread            " reload files changed on disk, i.e. via `git checkout`
au FocusLost * :wa      " save file when Vim loses focus
set hidden              " switch beteen buffers without saving

" -------------------------------------------------------------------
" With Git who needs backup files?
" -------------------------------------------------------------------
set nobackup
set noswapfile

" -------------------------------------------------------------------
" Set the color scheme
" -------------------------------------------------------------------
set background=dark
silent! colorscheme landscape

" -------------------------------------------------------------------
" Set tab stuff
" -------------------------------------------------------------------
set tabstop=4           " 4 spaces for a tab
set shiftwidth=4        " 4 spaces for autoindenting
set softtabstop=4       " when <BS>, pretend a tab is removed even if spaces
set expandtab           " expand tabs to spaces (overloadable by file type)

" -------------------------------------------------------------------
" Scrolling
" -------------------------------------------------------------------
set scrolloff=5         " show context above/below cursor line
set sidescrolloff=10    " number of cols from horizontal edge to  start scrolling
set sidescroll=1        " number of cols to scroll at a time

" -------------------------------------------------------------------
" Miscellaneous
" -------------------------------------------------------------------
" toggle listchars on or off
noremap <Leader>i :set list!<CR>

" Paste mode to prevent autoindentation of pasted lines
set pastetoggle=<F2>

" Better pasting from clipboard
" http://tilvim.com/2014/03/18/a-better-paste.html
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

set clipboard=unnamed   " yank and paste with the system clipboard

" show cursorline only in active window
if has("autocmd")
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
endif

" Map escape to jj -- much faster to reach and type
imap jj <esc>

" -------------------------------------------------------------------
" Searching
" -------------------------------------------------------------------
set incsearch           " use incremental search
set hlsearch            " highlight search results
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search string is all lower case, case-sensitve otherwise
" remove search highlighting with <F3>
nnoremap <silent> <leader>/ :nohlsearch<CR>

" -------------------------------------------------------------------
" Preserve function: saves search history and cursor position
" call with some command, like removing all whitespace
" -------------------------------------------------------------------
function! Preserve(command)
  " preparation: save last search, and cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business
  execute a:command
  " clean up: restore previous search history and cursor position
  let @/=_s
  call cursor(l,c)
endfunction

" strip whitespace from all lines in file
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" reindent entire file
nmap _= :call Preserve("normal gg=G")<CR>

" -------------------------------------------------------------------
" Splits
" -------------------------------------------------------------------
nnoremap <leader>v <C-w>v<C-w>l   " open a vertical split and switch to it (,v)
nnoremap <leader>h <C-w>s<C-w>j   " open a horizontal split and switch to it (,h)

" -------------------------------------------------------------------
" vimrc shortcuts
" -------------------------------------------------------------------
" open vimrc in new tab for editing
nmap <leader>ev :tabedit $MYVIMRC<cr>

" automatically source .vimrc when it is saved (from vimcasts.org #24)
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" reload .vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" -------------------------------------------------------------------
" Command line completion
" -------------------------------------------------------------------
"set wildmode                 " navigate <left> & <right> through completion lists
"set wildmode=list:longest    " allows expansion of items

" -------------------------------------------------------------------
" control whitespace preferences based on filetype
" -------------------------------------------------------------------
if has("autocmd")
  " enable file type detection
  filetype on

  " prevent Vim from auto-inserting comment on subsequent lines
  " http://tilvim.com/2013/12/30/remove-comment-prefix-2.html
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o

  " syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml

  " spell check Git commit messages
  autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us

  " start commit message in insert mode
  autocmd BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')

  " markdown files
  autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown setfiletype markdown
  autocmd BufNewFile,BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us
  autocmd FileType markdown setlocal tw=100

  " non ruby files related to Ruby
  autocmd BufNewFile,BufRead Gemfile,Gemfile.lock,Guardfile setfiletype ruby
  autocmd BufNewFile,BufRead Thorfile,config.ru,Vagrantfile setfiletype ruby
  autocmd BufNewFile,BufRead Berksfile,Berksfile.lock setfiletype ruby
  autocmd BufNewFile,BufRead Rakefile setfiletype rake
  autocmd BufNewFile,BufRead Rakefile set syntax=ruby
  autocmd BufNewFile,BufRead *.rake setfiletype rake
  autocmd BufNEwFile,BufRead *.rake set syntax=ruby

  " Chef uses Ruby, and this will enable the Chef snippets
  autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

  " Python files
  let NERDTreeIgnore = ['\.pyc$', '\~$', '\.rbc$']
  autocmd BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 expandtab

endif

" -------------------------------------------------------------------
" Stuff for Bundles
" -------------------------------------------------------------------

" theme
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 1
let g:badwolf_html_link_underline = 0
colorscheme badwolf

" vim-airline settings
let g:airline_powerline_fonts = 1

" set sections
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='badwolf'

" Control-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
nmap <C-n> :CtrlPDir<space>

" GUndo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

" MiniBufExpl setup
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" MiniBufExpl Colors
hi MBENormal               ctermfg=244 ctermbg=235
hi MBEChanged              ctermfg=166 ctermbg=235
hi MBEVisibleNormal        ctermfg=147 ctermbg=235
hi MBEVisibleChanged       ctermfg=164 ctermbg=235
hi MBEVisibleActiveNormal  ctermfg=229 ctermbg=235
hi MBEVisibleActiveChanged ctermfg=203 ctermbg=235

" EasyMotion
let g:EasyMotion_do_mapping = 0     " disable default mappings
let g:EasyMotion_smartcase = 1      " turn on case sensitive

" word motions
map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)

" line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" bidirectional search
nmap s <Plug>(easymotion-s2)

" Ag
let g:agprg = 'ag --nogroup --nocolor --column'
nmap <leader>/ :Ag<space>

" Parentheses
let g:rainbow_active = 1

" Snippeting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"  finished
" -------------------------------------------------------------------
