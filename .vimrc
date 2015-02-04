set nocompatible

colorscheme zenburn

cmap %/ <C-R>=expand("%:p:h") . '/'<CR>

set nowrap
set number
set wildmode=list:longest
set grepprg=ag

set incsearch

" Completion options
set completeopt=longest,menuone,preview
set complete-=i

" Enter in complete menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set expandtab
set shiftwidth=4
set tabstop=4

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

" Vundle stuff
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
let g:vundle_default_git_proto = 'git' " Use git protocol instead of https
call vundle#begin()
" vundle must be first here
Bundle 'gmarik/Vundle.vim'
Bundle 'wincent/Command-T'
Bundle 'nacitar/a.vim'
Bundle 'vim-scripts/perdirvimrc--Autoload-vimrc-files-per-di'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on
