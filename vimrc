set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pR0Ps/molokai-dark'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
"Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'majutsushi/tagbar'

Plug 'kien/ctrlp.vim'

call plug#end()

syntax on
filetype plugin indent on

set modelines=0
set hidden
set encoding=utf-8

set backup
set backupdir=~/.vim/.tmp
set writebackup
set directory=~/.vim/.tmp
if !has('nvim')
    set viminfo+=n~/.vim/.tmp/viminfo
endif

set smartindent
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set noshiftround

set ignorecase
set smartcase
set infercase
set hlsearch
set incsearch
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set gdefault

set backspace=indent,eol,start
set ttimeoutlen=0
set timeoutlen=1000
set completeopt=noinsert,menuone,noselect
set shortmess+=I

let mapleader=","

set t_Co=256
if (has("termguicolors"))
    set termguicolors
endif

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

"autocommand ColorScheme * call AdaptScheme()
set cul!

colorscheme molokai-dark

set noshowmode
set splitbelow
set splitright

set lazyredraw
set ttyfast
set showmatch
set cursorline

set listchars=tab:▸\ ,eol:¬
set guicursor=

set so=15
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

set number
set relativenumber

let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=10
let g:netrw_banner=0

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

nnoremap <silent> <Space> :noh<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> = :vertical resize +10<CR>
nnoremap <silent> - :vertical resize -10<CR>
nnoremap <silent> + :resize +10<CR>
nnoremap <silent> _ :resize -10<CR>

nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
"let g:lightline = {
"      \ 'colorscheme': 'molokai',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'fugitive#head'
"      \ },
"      \ }
"
"" make the lightline background transparent
"let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
"let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
"let s:palette.inactive.middle = s:palette.normal.middle
"let s:palette.tabline.middle = s:palette.normal.middle

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

" autoenable ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
