set background=dark
" colorscheme solarized
colorscheme desert

" F12: Increase transparency
set transparency=0
nnoremap <expr><F12> &transparency+20 > 100 ? ":set transparency=100\<CR>" : ":let &transparency=&transparency+20\<CR>"
" F12: Decrease transparency
nnoremap <expr><S-F12> &transparency-20 < 0 ? ":set transparency=0\<CR>" : ":let &transparency=&transparency-20\<CR>"

set lines=24
set columns=80

set guifont=SauceCodePro\ Nerd\ Font:h16
" set guifont=RictyDiminishedForPowerline-Regular:h19
