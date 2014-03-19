colorscheme zenburn

cmap %/ <C-R>=expand("%:p:h") . '/'<CR>

set nowrap
set number
set wildmode=list:longest
set grepprg=ag

set incsearch

" Completion options
set completeopt=longest,menuone,preview

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

set secure

set cursorline

set showcmd

set foldmethod=indent
set foldlevelstart=99

" Vundle stuff
filetype off " filetype must be off for vundle to work. It is enabled later
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" vundle must be first here
Bundle 'gmarik/vundle'
Bundle 'wincent/Command-T'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/perdirvimrc--Autoload-vimrc-files-per-di'
filetype on

