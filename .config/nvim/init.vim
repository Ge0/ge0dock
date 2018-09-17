set autoindent
set ignorecase
set ruler
set showcmd

filetype plugin indent on

syntax enable

colorscheme mustang

set cc=80
set mouse=a
hi ColorColumn ctermbg=darkgrey

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set guicursor=

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
call plug#end()
