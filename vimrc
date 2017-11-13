" author xorana
" lots of stuff stolen from other .vimrcs

" =======
" GENERAL
" =======

" use vim settings
set nocompatible

" security
set modelines=0

" hide buffers
set hidden

" caching
set undofile
set undodir=~/.vim/.undo

set backup
set backupdir=~/.vim/.tmp
set writebackup

set directory=~/.vim/.tmp

set viminfo+=n~/.vim/.tmp/viminfo

" fuzzy find
set path+=**

" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" case insensitive search
set ignorecase
set smartcase
set infercase

" searching
set hlsearch
set incsearch

" /g flag on substitutions by default
set gdefault

" make backspace great again
set backspace=indent,eol,start

" indents of four spaces
set shiftwidth=4

" dont expand tabs
set noexpandtab

" indentation every four columns
set tabstop=4

" let backspace delete indent
set softtabstop=4

" auto indenting
set smartindent
set autoindent

" set leader key to comma
let mapleader=","

" get rid of weird esc delay
set ttimeoutlen=0
set timeoutlen=1000

" ==
" UI
" ==

" terminal colours
" set termguicolors
set t_Co=256

" show matching brackets
set showmatch

" disable startup message
set shortmess+=I

" syntax highlighting
syntax on
set synmaxcol=512
filetype indent plugin on

" only render when necessary
set lazyredraw

" scroll offset
set so=15

" line numbers
set number
set relativenumber

" no line wrapping
set nowrap

" highlight cursor
set cursorline

" netrw file explorer
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=10
let g:netrw_banner=0

" remove .netrwhist file
let g:netrw_dirhistmax=0

" split more naturally
set splitbelow
set splitright

" ========
" COMMANDS
" ========

" hate shift
:command WQ wq
:command Wq wq
:command W w
:command Q q

" clear background off colour scheme
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

" clear colour scheme background
autocmd ColorScheme * call AdaptScheme()

" ========
" MAPPINGS
" ========

" clear search highlighting
nnoremap <silent> <Space> :noh<cr>

" quicker pane movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" buffer commands
nnoremap <Leader>l :ls<CR>:b<space>

" =======
" PLUGINS
" =======

execute pathogen#infect()

" lightline
" set laststatus=2
set noshowmode

"let g:lightline = {
"    \ 'colorscheme': 'seoul256',
"    \ }

" make the lightline background transparent
"let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
"let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
"let s:palette.inactive.middle = s:palette.normal.middle
"let s:palette.tabline.middle = s:palette.normal.middle

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

" nerdtree
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=45

nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" nnoremap <Leader> :NERDTreeFocus<CR>

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

" colour scheme
colorscheme molokai-dark
