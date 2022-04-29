" ---- Initialize Settings ----
set termguicolors


" https://github.com/sindresorhus/dark-mode
" brew install dark-mode
if system('which dark-mode') != ''
  let dark = trim(system('dark-mode status')) == 'on'
  exe 'set background=' . (dark ? 'dark' : 'light')
else
  set background=dark
end

" ---- Vim Plug ----
" Install vim-plug
if has('vim_starting')
  set rtp+=~/.local/share/nvim/site/autoload/plug.vim
  if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo 'install vim-plug...'
    call system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
endif


" ---- Plugins ----
call plug#begin('~/.local/share/nvim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
if has('nvim')
  Plug 'antoinemadec/FixCursorHold.nvim'
endif


" Syntax Highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Language Server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'liuchengxu/vista.vim'

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
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'knsh14/vim-github-link'
Plug 'voldikss/vim-translator'
Plug 'AndrewRadev/linediff.vim'

" Terminal
Plug 'voldikss/vim-floaterm'
Plug 'kassio/neoterm'

" Test
Plug 'janko/vim-test'

" Git
Plug 'tpope/vim-fugitive'

" Font
Plug 'lambdalisue/nerdfont.vim'

" ColorScheme
Plug 'lifepillar/vim-solarized8'
Plug 'jnurmine/Zenburn'
Plug 'Rigellute/rigel'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'

if has('mac')
  Plug 'kat0h/vim-auto-color-switcher', { 'do': 'make' }
endif

" Time tracking
" Plug 'wakatime/vim-wakatime'

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

" Appearance
set title
set hidden
set cmdheight=2
set laststatus=2
set showcmd
set number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set ruler
set list
set listchars=tab:>-,trail:_,extends:<
set showmatch
syntax enable

set encoding=utf-8
set mouse=a
set wildmenu
set backspace=indent,eol,start
set smartindent
set updatetime=300 " Default is 4000
set clipboard=unnamed
set formatoptions+=mM
filetype plugin indent on

set noswapfile
set nobackup
set noundofile

"Search
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan


" ---- Key Mappings ----
noremap ; :

" Hide search lighlights
nnoremap <ESC><ESC> :nohl<CR>

" Use spacebar as leader key
let mapleader = "\<Space>"

" Quit
nnoremap <silent> <leader>q :q<Cr>

" Buffer controls
nnoremap <silent> { :bprev<Cr>
nnoremap <silent> } :bnext<Cr>

nnoremap <silent> <leader>[ :bprev<Cr>
nnoremap <silent> <leader>] :bnext<Cr>

nnoremap <silent> <leader>w :bdelete<CR>
nnoremap <silent> <leader>W :bdelete!<CR>

" ---- Emacs keymap ----
inoremap <silent> <C-a> <HOME>
inoremap <silent> <C-e> <END>
inoremap <silent> <C-n> <Down>
inoremap <silent> <C-p> <Up>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-h> <BS>
inoremap <silent> <C-d> <Del>


" ---- Windows ----
" Split
set splitbelow
set splitright
nnoremap <C-w>- :sp<CR>
nnoremap <C-w>\ :vs<CR>
nnoremap <M--> :sp<CR>
nnoremap <M-\> :vs<CR>

" Move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize window
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-l> <C-w>>
nnoremap <M-h> <C-w><
" Reset window
nnoremap <M-r> <C-w>=
" Maximize window
nnoremap <M-a> <C-w>_<C-w><Bar>


" ---- Terminal ----
" Exit terminal mode with '\\'
tnoremap <silent> \\ <C-\><C-n>
" Open terminal in insert mode
" autocmd TermOpen term://* startinsert


" ---- Others ----
if executable('pdftotext')
  " https://github.com/jalan/pdftotext
  " pip3 install pdftotext

  " Convert PDF file to text
  autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
  autocmd BufRead *.pdf setlocal readonly nolist
else
  " Open PDF file with other application
  autocmd BufRead *.pdf execute('!open %') | execute('bdelete')
endif


" ---- Plugins ----
if s:plug.is_installed('vim-easymotion')
  nmap <leader><leader> <Plug>(easymotion-overwin-f)
endif


if s:plug.is_installed('vim-floaterm')
  let g:floaterm_width = 0.9
  let g:floaterm_height = 0.9
  let g:floaterm_autoclose = 1
  nnoremap <silent> <C-t> :FloatermToggle<Cr>
  nnoremap <silent> <leader>tt :FloatermNew<Cr>
  nnoremap <silent> <leader>t] :FloatermNext<Cr>
  nnoremap <silent> <leader>t[ :FloatermPrev<Cr>
  nnoremap <silent> <leader>tw :FloatermKill<Cr>
  nnoremap <silent> <C-g> :FloatermNew lazygit<Cr>
endif


if s:plug.is_installed('fzf.vim')
  nnoremap <leader>f :Rg<Cr>
  vmap <leader>f :Rg<Cr>
  nnoremap <leader>p :Files<Cr>
  nnoremap <leader>b :Buffers<Cr>
  nnoremap <leader><TAB> :History<Cr>
  nnoremap <Leader>/ :Rg<Space>
  nnoremap <Leader>h :BCommits<Cr>
endif


if s:plug.is_installed('coc.nvim')
  let g:coc_global_extensions = [
        \ 'coc-snippets',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-svelte',
        \ 'coc-prettier',
        \ 'coc-eslint',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-lists',
        \ 'coc-highlight',
        \ 'coc-omnisharp',
        \ 'coc-yaml',
        \ 'coc-tailwindcss',
        \ 'coc-styled-components',
        \ 'coc-java',
        \ 'coc-git',
        \ ]

  nmap <silent><C-]> <Plug>(coc-definition)
  nmap <silent><Leader>r  <Plug>(coc-rename)
  nnoremap K :call <SID>show_documentation()<CR>
  nmap <C-p> <Plug>(coc-diagnostic-prev)
  nmap <C-n> <Plug>(coc-diagnostic-next)

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

  " Select sugestion
  inoremap <expr> <Tab> pumvisible() ? "\<Down>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<Up>" : "\<S-Tab>"
  inoremap <expr> <C-n> pumvisible() ? "\<Down>" : "\<C-n>"
  inoremap <expr> <C-p> pumvisible() ? "\<Up>" : "\<C-p>"

  " Git
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)

  command! GitCopyUrl :CocCommand git.copyUrl
  command! GitOpenUrlInBrowser :CocCommand git.browserOpen
endif


if s:plug.is_installed('vista.vim')
  let g:vista#renderer#enable_icon = 1
  let g:airline#extensions#vista#enabled = 1

  nnoremap <silent> <leader>l :Vista!!<Cr>
  nnoremap <silent> <leader>o :Vista finder<Cr>

  if s:plug.is_installed('coc.nvim')
    let g:vista_default_executive = 'coc'
  endif
endif


if s:plug.is_installed('nvim-treesitter')
lua <<EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash", "c", "c_sharp", "clojure", "cpp", "css", "dart", "dockerfile",
      "fish", "go", "gomod", "graphql", "html", "http", "java", "javascript",
      "jsdoc", "json", "kotlin", "lua", "make", "markdown", "nix", "ocaml",
      "python", "ruby", "rust", "scss", "svelte", "swift", "toml", "tsx",
      "typescript", "vim", "vue", "yaml",
    },
    -- ignore_install = { "javascript" },
    highlight = {
      enable = true,
      -- disable = { "c", "rust" },
    },
  }
EOF
endif


if s:plug.is_installed('fern.vim')
  let g:fern#default_hidden = 1

  nnoremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle <CR>

  function! s:init_fern() abort
    nmap <buffer> <CR> <Plug>(fern-action-open-or-expand)
    nmap <buffer> o <Plug>(fern-action-open-or-expand)
    nmap <buffer> <C-l> <C-W>l
  endfunction

  augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
    autocmd BufWinEnter * ++nested execute "FernDo -stay :FernReveal " . @%
  augroup END
endif

if s:plug.is_installed('fern-renderer-nerdfont.vim')
  let g:fern#renderer = "nerdfont"
endif


if s:plug.is_installed('caw.vim')
  " Ctrl + / to toggle comments.
  nmap <C-_> <Plug>(caw:hatpos:toggle)
  vmap <C-_> <Plug>(caw:hatpos:toggle)
endif


if s:plug.is_installed('goyo.vim')
  let g:goyo_width = "70%"
  " Ctrl + Enter to toggle Goyo
  nnoremap <silent> <C-CR> :Goyo<CR>
endif


if s:plug.is_installed('vim-translator')
  let g:translator_target_lang = "ja"
endif


if s:plug.is_installed('vim-airline')
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  set laststatus=2
endif


if s:plug.is_installed('vim-airline-themes')
  let g:airline_theme = 'murmur'
endif


" if s:plug.is_installed('rigel')
"   set background=dark
"   let g:rigel_airline = 1
"   let g:airline_theme = 'rigel'
"   colorscheme rigel
" endif


if s:plug.is_installed('vim-solarized8')
  colorscheme solarized8_flat
  let g:airline_theme = 'solarized'
endif


" if s:plug.is_installed('Zenburn')
"   set background=dark
"   colorscheme zenburn
" endif


" if s:plug.is_installed('nord-vim')
"   set background=dark
"   let g:airline_theme = 'nord'
"   colorscheme nord
" endif


" if s:plug.is_installed('iceberg.vim')
"   set background=dark
"   let g:airline_theme = 'iceberg'
"   colorscheme iceberg
" endif
