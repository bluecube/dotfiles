colorscheme zenburn

cmap %/ <C-R>=expand("%:p:h") . '/'<CR>

set nowrap
set number
set wildmode=list:longest
set grepprg=internal

set incsearch

" Completion options
set completeopt=longest,menuone,preview

" Enter in complete menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ctrl-space
noremap <Nul> <C-x><C-o>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set expandtab
set shiftwidth=4
set tabstop=4

autocmd FileType make set noexpandtab

" Show tabs and extra spaces.
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * call matchadd('ExtraWhitespace', '\%>80v.\+', -1)
" autocmd BufWinEnter * call matchadd('ExtraWhitespace', '\s\+$', -1)
" autocmd BufWinLeave * call clearmatches()

set list listchars=tab:→\ ,precedes:⇐,extends:⇒,trail:▫

" Tag list
nnoremap <silent> <F9> :TlistToggle<CR>

" Keep at least two lines around cursor on screen
set scrolloff=2

set secure

set cursorline

" Write file using sudo with :w!!
cnoremap W w !sudo tee >/dev/null %
