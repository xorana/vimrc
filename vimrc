set nocompatible
set rtp+=~/.vim

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-python/python-syntax'

" colorschemes
Plug 'tomasiser/vim-code-dark'

" airline
" Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

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

set backspace=indent,eol,start
set ttimeoutlen=0
set timeoutlen=1000
set completeopt=noinsert,menuone,noselect,preview
set shortmess+=I
set shortmess+=c

function! AdaptScheme()
    hi clear CursorLine
    hi Normal ctermbg=none cterm=none
    hi LineNr ctermbg=none cterm=none
    hi Folded ctermbg=none cterm=none
    hi NonText ctermbg=none cterm=none
    hi SpecialKey ctermbg=none cterm=none
    hi VertSplit ctermbg=none cterm=none
    hi Signcolumn ctermbg=none cterm=none
    hi LineNr ctermbg=none cterm=none
    hi CursorLineNr ctermbg=none cterm=none
    hi StatusLine ctermbg=none cterm=none
    hi EndOfBuffer ctermbg=none cterm=none
    hi Directory ctermbg=none cterm=none
endfunction

autocmd ColorScheme * call AdaptScheme()

colorscheme codedark
set background=dark

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
nnoremap <silent> <leader>b :buffers<cr>

nnoremap <leader>1 :colorscheme codedark<cr>
nnoremap <leader>2 :colorscheme monokai<cr>

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-pairs',
    \ 'coc-python'
    \ ]

let g:python_highlight_all = 1

let g:airline_theme = 'codedark'

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" NERDTree
nnoremap <leader>f :NERDTreeToggle<cr>
