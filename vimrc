set shell=/bin/bash
set nocompatible "forget about vi
vnoremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

filetype off "for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"plugins
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set history=500
set autoread
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set laststatus=2
set mouse=a
