" vimrc.bundles
call plug#begin('~/.vim/plugged')

" editing
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" look & feel
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fholgado/minibufexpl.vim'
Plug 'junegunn/seoul256.vim'

" languages
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" utilities
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

"""
""" General
"""
if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

"""
""" Editor config
"""
" Avoid causing problems with the vim-fugitive plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"""
""" Ctrl-P
"""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

nmap <C-n> :CtrlPDir<space>

"""
""" Completion
"""
let g:UltiSnipsExpandTrigger = "<leader>e"
let g:UltiSnipsJumpForwardTrigger = "<leader>f"
let g:UltiSnipsJumpBackwardTrigger = "<leader>b"

"""
""" EasyMotion
"""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-w)
map <leader>b <Plug>(easymotion-b)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-s2)

"""
""" Colorscheme
"""
set background=dark
silent! colorscheme seoul256

"""
""" Airline
"""
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

" Enable the list of buffers & hide function display
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='badwolf'

"""
""" MiniBuf
"""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" colors
hi MBENormal               ctermfg=244 ctermbg=235
hi MBEChanged              ctermfg=166 ctermbg=235
hi MBEVisibleNormal        ctermfg=147 ctermbg=235
hi MBEVisibleChanged       ctermfg=164 ctermbg=235
hi MBEVisibleActiveNormal  ctermfg=229 ctermbg=235
hi MBEVisibleActiveChanged ctermfg=203 ctermbg=235

"""
""" Parentheses
"""
let g:rainbow_active = 1

"""
""" NERDTree
"""
map <c-n> :NERDTreeToggle<CR>

"""
""" Go IDE
"""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc-browser)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
