set nocompatible

colorscheme zenburn

cmap %/ <C-R>=expand("%:p:h") . '/'<CR>

set nowrap
set number
set wildmode=list:longest
if executable('rg')
    set grepprg=rg\ --vimgrep\ --hidden
endif

set incsearch

" Completion options
set completeopt=menuone,preview,noinsert
set complete-=i
autocmd CompleteDone * silent! pclose " Close preview window when completion is done

" Enter in complete menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

autocmd FileType make set noexpandtab

set list listchars=tab:→\ ,precedes:⇐,extends:⇒,trail:▫
set modeline

" Tag list
nnoremap <silent> <F9> :TlistToggle<CR>

" Keep at least two lines around cursor on screen
set scrolloff=2

set nobackup
set nowritebackup
set noswapfile

set secure

set cursorline

set showcmd

set foldmethod=indent
set foldlevelstart=99

set formatoptions+=j " Remove comment leader when joining lines

" Configuration for gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0
highlight clear SignColumn

" Configuration for localvimrc
let g:localvimrc_persistent = 1 " Store and restore decisions only if the answer was given in upper case

" Language server config
let g:lsc_server_commands = {
    \ 'python': 'pylsp',
    \ 'c': 'clangd',
    \ 'cpp': 'clangd',
    \ 'rust': 'rls',
    \}
    " These must be installed externally!

let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': ''}
    " use default key mappings but unmap previous reference, because it
    " conflicts with ctrl-p

call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'nacitar/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'natebosch/vim-lsc'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
call plug#end()
