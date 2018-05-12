" GENERAL

set nocompatible
set modelines=0
set hidden

"set undofile
"set undodir=~/.vim/.undo
set backup
set backupdir=~/.vim/.tmp
set writebackup
set directory=~/.vim/.tmp
set viminfo+=n~/.vim/.tmp/viminfo
let g:netrw_dirhistmax=0

set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignorecase

set ignorecase
set smartcase
set infercase
set hlsearch
set incsearch

set gdefault

set backspace=indent,eol,start
set encoding=utf-8

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set noshiftround

set smartindent
set autoindent

let mapleader=","

set ttimeoutlen=0
set timeoutlen=1000
set shortmess+=I

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colourschemes
Plug 'pR0Ps/molokai-dark'
Plug 'dylanaraps/wal.vim'

" Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'bling/vim-bufferline'
" Plug 'leafgarland/typescript-vim'
" Plug 'ervandew/supertab'

call plug#end()

" UI

syntax on
set synmaxcol=512
filetype indent plugin on

set t_Co=256

" clear background
function! AdaptScheme()
    highlight clear CursorLine
    highlight Normal ctermbg=none
    highlight LineNr ctermbg=none
    highlight Folded ctermbg=none
    highlight NonText ctermbg=none
    highlight SpecialKey ctermbg=none
    highlight VertSplit ctermbg=none
    highlight Signcolumn ctermbg=none
    highlight LineNr ctermbg=none
    highlight CursorLineNr ctermbg=none
endfunction

autocmd ColorScheme * call AdaptScheme()

colorscheme monokai

set showmatch
set cursorline

set lazyredraw
set ttyfast

set so=15
set nowrap

set number
set relativenumber

set splitbelow
set splitright

let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=10
let g:netrw_banner=0

set noshowmode

" COMMANDS

command WQ wq
command Wq wq
command W w
command Q q

function! s:wipeout()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  let wiped = 0
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1 && !getbufvar(v:val,"&mod")')
    silent execute 'bwipeout!' buf
    let wiped += 1
  endfor
  echom wiped . ' buffers wiped'
endfunction
command! Wipeout call s:wipeout()

" MAPPINGS

" clear search highlighting
nnoremap <silent> <Space> :noh<cr>

" quicker pane movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" pane resize
nnoremap <silent> = :vertical resize +10<CR>
nnoremap <silent> - :vertical resize -10<CR>
nnoremap <silent> + :resize +10<CR>
nnoremap <silent> _ :resize -10<CR>

" buffer commands
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" PLUGINS

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" display tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamempd = ':t'

" display buffer line
let g:airline#extensions#bufferline#enabled = 1

" lightline
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" make the lightline background transparent
" let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
" let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
" let s:palette.inactive.middle = s:palette.normal.middle
" let s:palette.tabline.middle = s:palette.normal.middle

" nerdtree
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=45

" when opening vim with no files, open nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close if only thing left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" close nerdtree when a file is opened
let NERDTreeQuitOnOpen=1

" get rid of ? and replace arrows
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

