set nocompatible
set rtp+=~/.vim

call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-python/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/echodoc.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

" colorschemes
Plug 'pR0Ps/molokai-dark'
Plug 'tomasr/molokai'
Plug 'liuchengxu/space-vim-dark'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

call plug#end()

syntax on
filetype plugin indent on
set modelines=0
set noshowmode
set hidden
set encoding=utf-8

set backup
set backupdir=~/.vim/.tmp
set writebackup
set directory=~/.vim/.tmp
if !has('nvim')
    set viminfo+=n~/.vim/.tmp/viminfo
endif

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set noshiftround

" search
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
set completeopt=noinsert,menuone,noselect,preview
set shortmess+=I
set shortmess+=c

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

colorscheme molokai
set background=dark
hi Comment guifg=#5C6370 ctermfg=59

set splitbelow
set splitright

set lazyredraw
set ttyfast
set showmatch

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

set virtualedit=block

let g:netrw_liststyle=3
let g:netrw_browse_split=5
let g:netrw_winsize=10
let g:netrw_banner=0

let mapleader=","

nnoremap <silent> <space> :noh<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <c-p> :FZF<cr>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

nnoremap <leader>1 :colorscheme molokai-dark<cr>
nnoremap <leader>2 :colorscheme molokai<cr>
nnoremap <leader>3 :colorscheme xoria256<cr>

imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" fzf
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" bufferline
let g:bufferline_echo = 0

" python-syntax
let g:python_highlight_all = 1

" airline
"let g:airline_powerline_fonts = 1
let g:airline_theme='dark_minimal'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamempd = ':t'
let g:airline#extensions#bufferline#enabled = 1
