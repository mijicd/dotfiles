" vimrc.bundles
call plug#begin('~/.vim/bundle')

" utilities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-ctrlspace/vim-ctrlspace'

" editing
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" UI
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'

call plug#end()

" common settings
set background=dark
colorscheme gruvbox

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:lightline = { 'colorscheme': 'seoul256' }
let g:rainbow_active = 1

nmap <C-t> :NERDTreeToggle<CR>

" FZF
nmap <C-f> :Files<CR>
nmap <C-g> :Commits<CR>
