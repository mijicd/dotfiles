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
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins', 'for': 'scala' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'

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

nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>t :ALEToggle<CR>

" FZF
nmap <leader>f :Files<CR>
nmap <leader>c :Commits<CR>

" LSP
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <leader>lk :call LanguageClient#textDocument_hover()<CR>
map <leader>lg :call LanguageClient#textDocument_definition()<CR>
map <leader>lr :call LanguageClient#textDocument_rename()<CR>
map <leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <leader>lb :call LanguageClient#textDocument_references()<CR>
map <leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Intero
augroup interoMaps
  au!

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>

  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

let g:intero_start_immediately = 0
let g:intero_type_on_hover = 1
let g:intero_window_size = 15
let g:intero_vertical_split = 1

" Ensime
augroup ensimeMaps
  au!

  au BufWritePost *.scala silent :EnTypeCheck
  au FileType scala nmap <leader>et :EnType<CR>
  au FileType scala nmap <leader>ed :EnDeclaration<CR>
  au FileType scala nmap <leader>er :EnRename<CR>
augroup END
