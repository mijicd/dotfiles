" vimrc.bundles
call plug#begin('~/.config/nvim/plugged')

" editing
Plug 'editorconfig/editorconfig-vim'
Plug 'dahu/vim-fanfingtastic'
Plug 'luochen1990/rainbow'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" look & feel
Plug 'bling/vim-airline'
Plug 'fholgado/minibufexpl.vim'
Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'

" languages
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" utilities
Plug 'kien/ctrlp.vim'

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
""" Neosnippet
"""
" expand snippets in select, insert, or visual mode
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" move between snippet placeholders using tab
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"""
""" EasyMotion
"""
let g:EasyMotion_leader_key = '<Space>'

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
let g:airline_theme='apprentice'

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
