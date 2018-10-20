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
nmap <Leader>t :ALEToggle<CR>

" FZF
nmap <C-p> :Files<CR>
nmap <C-g> :Commits<CR>

" LSP
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Intero
augroup interoMaps
  au!

  " Background process and window management
  au FileType haskell nnoremap <silent> <Leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <Leader>ik :InteroKill<CR>

  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <Leader>io :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <Leader>ih :InteroHide<CR>

  " Manually save and reload
  au FileType haskell nnoremap <silent> <Leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <Leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <Leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  au FileType haskell map <silent> <Leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <Leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <Leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <Leader>jd :InteroGoToDef<CR>

  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <Leader>ist :InteroSetTargets<SPACE>
augroup END

let g:intero_start_immediately = 0
let g:intero_type_on_hover = 1

" Ensime
augroup ensimeMaps
  au!

  au BufWritePost *.scala silent :EnTypeCheck
  au FileType scala nmap <Leader>et :EnType<CR>
  au FileType scala nmap <Leader>ed :EnDeclaration<CR>
  au FileType scala nmap <Leader>er :EnRename<CR>
augroup END
