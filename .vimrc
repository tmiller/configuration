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

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Hud
set ruler
set number
set list
set listchars=tab:>\ ,trail:~,extends:>,precedes:<,nbsp:+
set laststatus=2
set showbreak=>>>

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

" Backup Directories
set backupdir=$VIM_BACKUP,~/.vim/backups,.
set directory=$VIM_SWAP,~/.vim/swaps,.
if exists('&undodir')
  set undodir=$VIM_UNDO,~/.vim/undo,.
endif

" Fix backspace
set backspace=indent,eol,start

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

"=============================================
" File specific settings
"=============================================
augroup FiletypeOptions
  autocmd!
  autocmd FileType sh,bash,zsh        setlocal autoindent expandtab smarttab shiftwidth=4 softtabstop=4
  autocmd FileType c,cpp,cs,java      setlocal autoindent expandtab smarttab shiftwidth=4 softtabstop=4 cin
  autocmd FileType python,perl        setlocal autoindent expandtab smarttab shiftwidth=4 softtabstop=4
  autocmd FileType ruby,haml,eruby    setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType yaml,html,json     setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType xml,xsd,xslt       setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType javascript,coffee  setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType cucumber           setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType scss,sass,css      setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType yaml,html,xml      setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType vim, gitconfig     setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2
  autocmd FileType sh,zsh,csh,tcsh    inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
  autocmd FileType perl,python,ruby   inoremap <silent> <buffer> <C-X>! #!/usr/bin/<C-R>=&ft<CR>
augroup END

