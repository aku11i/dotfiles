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
Plug 'ujihisa/unite-colorscheme'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Language Server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
" TypeScript
Plug 'leafgarland/typescript-vim'
" JavaScript
Plug 'othree/yajs.vim'
" JSX
Plug 'maxmellon/vim-jsx-pretty'
" fish
Plug 'dag/vim-fish'
" Powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" for resize screen
Plug 'kana/vim-submode'
" Toggle comments
Plug 'tyru/caw.vim'

" Text
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

" Test
Plug 'janko/vim-test'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ---- ColorScheme ----
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'

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
set smartcase
set incsearch
set wrapscan
set clipboard=unnamed
set list
set listchars=tab:>-,trail:_,extends:<
set updatetime=500 " Default is 4000

" ---- Key Mappings ----
noremap ; :
nnoremap <C-c> :q<Cr>
" Exit Terminal Mode
tnoremap <silent> <C-[> <C-\><C-n>

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
nnoremap <C-w>- :sp<CR>
nnoremap <C-w>\ :vs<CR>

" Switch windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"File type
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx

if s:plug.is_installed('fzf.vim')
  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang Grep call RipgrepFzf(<q-args>, <bang>0)

  " nnoremap <C-g> :Grep<Cr>
  nnoremap <C-p> :Files<Cr>
  nnoremap <C-g> :Buffers<Cr>
endif

if s:plug.is_installed('coc.nvim')
  " gd - go to definition of word under cursor
  nmap <silent><C-]> <Plug>(coc-definition)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  " gi - go to implementation
  nmap <silent> gi <Plug>(coc-implementation)
  " gr - find references
  nmap <silent> gr <Plug>(coc-references)
  " rename the current word in the cursor
  nmap <leader>cr  <Plug>(coc-rename)
  nmap <leader>cf  <Plug>(coc-format-selected)
  vmap <leader>cf  <Plug>(coc-format-selected)
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
  nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>

  inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
endif

if s:plug.is_installed('nerdtree')
  nnoremap <silent><C-e> :NERDTreeToggle<CR>
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


if s:plug.is_installed('vim-submode')
  function Submode()
    call submode#enter_with('bufmove', 'n', '', '<C-w><S-l>', '<C-w>>')
    call submode#enter_with('bufmove', 'n', '', '<C-w><S-h>', '<C-w><')
    call submode#enter_with('bufmove', 'n', '', '<C-w><S-j>', '<C-w>+')
    call submode#enter_with('bufmove', 'n', '', '<C-w><S-k>', '<C-w>-')
    call submode#map('bufmove', 'n', '', '<S-l>', '<C-w>>')
    call submode#map('bufmove', 'n', '', '<S-h>', '<C-w><')
    call submode#map('bufmove', 'n', '', '<S-j>', '<C-w>+')
    call submode#map('bufmove', 'n', '', '<S-k>', '<C-w>-')
  endfunction
  autocmd VimEnter * nested call Submode()
endif


if s:plug.is_installed('caw.vim')
  " Ctrl + / to toggle comments.
  nmap <C-_> <Plug>(caw:hatpos:toggle)
  vmap <C-_> <Plug>(caw:hatpos:toggle)
endif

if isdirectory(expand('~/.fzf'))
  set rtp+=~/.fzf
endif

if s:plug.is_installed('vim-airline')
  let g:airline_powerline_fonts = 1
  set laststatus=2
endif

if s:plug.is_installed('vim-airline-themes')
  let g:airline_theme = 'murmur'
endif

if s:plug.is_installed('vim-colors-solarized')
  set background=dark
  colorscheme solarized
endif

" if s:plug.is_installed('Zenburn')
"   set background=dark
"   colorscheme zenburn
" endif

if s:plug.is_installed('typescript-vim')
  let g:typescript_indent_disable = 1
endif
