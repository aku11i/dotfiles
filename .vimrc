set background=dark
set mouse=a
set noswapfile
set nobackup
set noundofile
set cmdheight=2
set laststatus=2
set title
set wildmenu
set backspace=indent,eol,start
set showcmd
syntax enable
filetype plugin indent on
set ruler
set encoding=utf-8
set number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smartindent
set showmatch
set formatoptions+=mM
set hlsearch
set smartcase
set incsearch
set wrapscan
set clipboard=unnamed,autoselect
set list
set listchars=tab:>-,trail:_,extends:<

noremap ; :

" Emacs keymap
inoremap <silent> <C-a> <HOME>
inoremap <silent> <C-e> <END>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-h> <BS>
inoremap <silent> <C-d> <Del>
