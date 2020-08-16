" ---- Initialize Settings ----
set termguicolors

" ---- Vim Plug ----
" Install vim-plug
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo 'install vim-plug...'
    call system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
endif

" ---- Plugins ----
call plug#begin('~/.local/share/nvim/plugged')
" Icon font
Plug 'ryanoasis/vim-devicons'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Syntax Highlight
Plug 'sheerun/vim-polyglot'

" Language Server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting

" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Toggle comments
Plug 'tyru/caw.vim'

" Text
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'

" Terminal
Plug 'kassio/neoterm'

" Test
Plug 'janko/vim-test'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Discord Status
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

" ColorScheme
Plug 'lifepillar/vim-solarized8'
Plug 'jnurmine/Zenburn'
Plug 'Rigellute/rigel'

call plug#end()

let s:plug = {
      \ "plugs": get(g:, 'plugs', {})
      \ }

function! s:plug.is_installed(name)
  return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" ---- Vim Settings ----

" Default Shell
set sh=fish

set hidden
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
set ignorecase
set smartcase
set incsearch
set wrapscan
set clipboard=unnamed
set list
set listchars=tab:>-,trail:_,extends:<
set updatetime=300 " Default is 4000

" ---- Key Mappings ----
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

" Split windows
set splitbelow
set splitright
nnoremap <C-w>- :sp<CR>
nnoremap <C-w>\ :vs<CR>
nnoremap <M--> :sp<CR>
nnoremap <M-\> :vs<CR>

" Move window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal
" Exit terminal mode with ESC
tnoremap <silent> <C-[> <C-\><C-n>
" Open terminal with insert mode
autocmd TermOpen term://* startinsert
" Open terminal in minimal split window
command! -nargs=* Term split | resize 15 | terminal <args>
nnoremap <silent> <leader>t :Term<Cr>

" Resize window
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-l> <C-w>>
nnoremap <M-h> <C-w><
" Reset window
nnoremap <M-r> <C-w>=
" Maximize window
nnoremap <M-a> <C-w>_<C-w><Bar>

if s:plug.is_installed('fzf.vim')
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang Grep call RipgrepFzf(<q-args>, <bang>0)

  nnoremap <C-g> :Grep<Cr>
  nnoremap <C-p> :Files<Cr>
  nnoremap <C-t> :Buffers<Cr>
endif


if isdirectory(expand('~/.fzf'))
  set rtp+=~/.fzf
endif


if s:plug.is_installed('vim-polyglot')
  let g:polyglot_disabled = ['markdown']
endif


if s:plug.is_installed('coc.nvim')
  nmap <silent><C-]> <Plug>(coc-definition)
  nmap <silent><Leader>r  <Plug>(coc-rename)
  nnoremap K :call <SID>show_documentation()<CR>
  nmap [g <Plug>(coc-diagnostic-prev)
  nmap ]g <Plug>(coc-diagnostic-next)

  nnoremap [Coc] <Nop>
  nmap <Leader>c [Coc]
  nmap [Coc]d <Plug>(coc-definition)
  nmap [Coc]t <Plug>(coc-type-definition)
  nmap [Coc]i <Plug>(coc-implementation)
  nmap [Coc]r <Plug>(coc-references)
  nmap [Coc]f  <Plug>(coc-format-selected)
  vmap [Coc]f  <Plug>(coc-format-selected)
  nmap [Coc]p <Plug>(coc-diagnostic-prev)
  nmap [Coc]n <Plug>(coc-diagnostic-next)
  nnoremap [Coc]o  :<C-u>CocList outline<cr>
  nnoremap [Coc]s  :<C-u>CocList -I symbols<cr>
  nnoremap [Coc]k :call <SID>show_documentation()<CR>

  " Show documentation in preview window
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocActionAsync('doHover')
    endif
  endfunction

  " Highlight symbol and show documentation under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Tab completion
  inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
endif


if s:plug.is_installed('nerdtree')
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
  let NERDTreeShowHidden = 1
endif


if s:plug.is_installed('vim-divicons')
  let g:webdevicons_conceal_nerdtree_brackets = 1
  let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  let g:DevIconsDefaultFolderOpenSymbol = ''
  " file-icons
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
endif


if s:plug.is_installed('caw.vim')
  " Ctrl + / to toggle comments.
  nmap <C-_> <Plug>(caw:hatpos:toggle)
  vmap <C-_> <Plug>(caw:hatpos:toggle)
endif


if s:plug.is_installed('vim-airline')
  let g:airline_powerline_fonts = 1
  set laststatus=2
endif


if s:plug.is_installed('vim-airline-themes')
  let g:airline_theme = 'murmur'
endif


if s:plug.is_installed('rigel')
  set background=dark
  let g:rigel_airline = 1
  let g:airline_theme = 'rigel'
  colorscheme rigel
endif


" if s:plug.is_installed('vim-solarized8')
"   set background=dark
"   colorscheme solarized8_flat
" endif


" if s:plug.is_installed('Zenburn')
"   set background=dark
"   colorscheme zenburn
" endif

