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
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ujihisa/unite-colorscheme'

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
"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
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
" Ctrl + K to comment out a line
Plug 'tyru/caw.vim'

Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

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

" Denite
nnoremap ,dB :<C-u>Denite buffer -buffer-name=file<CR>
nnoremap ,df :<C-u>DeniteBufferDir -buffer-name=files file<CR>
nnoremap ,db :<C-u>Denite buffer<CR>
nnoremap ,dr :<C-u>Denite file_old<CR>
nnoremap ,dR :<C-u>Denite command_history<CR>
nnoremap ,dg :<C-u>Denite grep<CR>
nnoremap ,dG :<C-u>Denite grep .<CR>
nnoremap ,dw :<C-u>DeniteCursorWord grep<CR>
nnoremap ,dW :<C-u>DeniteCursorWord grep .<CR>
"----

if s:plug.is_installed('coc.nvim')
  " gd - go to definition of word under cursor
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
endif

if s:plug.is_installed('denite.nvim')
  let g:extra_whitespace_ignored_filetypes = ['denite']
  let g:denite_enable_ignore_case = 1
  let g:denite_enable_smart_case = 1
  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')

  if executable('ag')
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'default_opts', ['--follow', '--no-group', '--no-color'])
  endif
endif

if s:plug.is_installed('deoplete.nvim')
  " Use deoplete.
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#enable_camel_case = 0
  let g:deoplete#enable_ignore_case = 0
  let g:deoplete#enable_refresh_always = 0
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#file#enable_buffer_path = 1
  let g:deoplete#max_list = 10000
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
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
  nmap <C-k> <Plug>(caw:hatpos:toggle)
  vmap <C-k> <Plug>(caw:hatpos:toggle)
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
