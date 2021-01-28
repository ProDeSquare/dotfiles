set exrc
set ruler
set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set clipboard+=unnamedplus
set mouse=a
set splitbelow
set splitright
set foldcolumn=2
set noshowmode
set background=dark

" Space for messages
set cmdheight=2

" leader
let mapleader=" "

" remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
