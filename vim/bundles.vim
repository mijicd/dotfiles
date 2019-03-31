" vimrc.bundles
call plug#begin('~/.vim/bundle')

Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" common settings
set background=dark
colorscheme gruvbox

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:lightline = { 'colorscheme': 'seoul256' }
let g:rainbow_active = 1
