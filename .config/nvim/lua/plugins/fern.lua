vim.g['fern#renderer'] = { "nerdfont" }

return {
  "lambdalisue/fern.vim",
  "lambdalisue/fern-git-status.vim",
  config = function ()
  vim.cmd([[
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
  ]])

  end
}
