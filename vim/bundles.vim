" vimrc.bundles
call plug#begin('~/.vim/bundle')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

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

set background=dark
colorscheme gruvbox

"""
""" Ctrl-P
"""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"""
""" EasyMotion
"""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>b <Plug>(easymotion-b)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-s2)

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
let g:airline_theme='gruvbox'

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
""" Other
"""
" Avoid causing problems with the vim-fugitive plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:rainbow_active = 1

nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>t :ALEToggle<CR>
