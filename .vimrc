source ~/.vim/bundles/vim-pathogen/autoload/pathogen.vim
call pathogen#infect(expand('~/.vim/bundles'))

"Start .vimrc
set nocompatible
filetype plugin indent on

"=============================================
" Options
"=============================================

" Color
set t_Co=256
colorscheme wombat256mod
syntax on

" Shut the hell up and leave me alone
set noerrorbells
set visualbell
set t_vb=

" Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Hud
set ruler
set number
set list
set listchars=tab:>\ ,trail:~
set laststatus=3

" Tab completion
set wildmode=list:longest,full
set wildignore=*.swp,*.o,*.so
set wildmenu

" Scroll
set scrolloff=3

" Buffer
set hidden

" History
set history=1000
set undolevels=1000

" Backup
set directory=$VIM_BACKUP,~/.vim/backup,.


"=============================================
" Remaps
"=============================================

let mapleader=','
let maplocalleader=','

" Jump key
nnoremap ` '
nnoremap ' `

" Turn off search highlight
nnoremap ,/ :nohlsearch<CR>

" Change pane
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigate wrapped lines
noremap j gj
noremap k gk

" Trim trailing whitespace
nnoremap <localleader>ts m`:%s/\s\+$//e<CR>``

" vim-commentary shortcuts
xmap gc \\
nmap gc \\
nmap gcc \\\
