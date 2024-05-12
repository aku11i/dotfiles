return {
    "tyru/caw.vim",
  config = function ()
  vim.cmd([[
    " Ctrl + / to toggle comments.
    nmap <C-_> <Plug>(caw:hatpos:toggle)
    vmap <C-_> <Plug>(caw:hatpos:toggle)
  ]])
  end
}
