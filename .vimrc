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

set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/.tmp/.viminfo

" fuzzy find
set path+=**

" lazy file name tab completion
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" ignore files that vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

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
" set smartindent
" set autoindent

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

" ========
" COMMANDS
" ========

" hate shift
:command WQ wq
:command Wq wq
:command W w
:command Q q

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
map <silent> <Space> :noh<cr>

" =======
" PLUGINS
" =======

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
"Plug 'dylanaraps/wal.vim'
Plug 'crusoexia/vim-monokai'

call plug#end()

" lightline
set laststatus=2
set noshowmode

let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }

" make the lightline background transparent
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

" colour scheme
" has to go down here because it needs to go after the plugin
colorscheme monokai
