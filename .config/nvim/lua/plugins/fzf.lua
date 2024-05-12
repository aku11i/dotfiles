return {
  "junegunn/fzf",
  "junegunn/fzf.vim",
  dir = "~/.fzf",
  build = "./install --all",
  config = function ()
    vim.cmd([[
      nnoremap <leader>f :Rg<Cr>
      vmap <leader>f :Rg<Cr>
      nnoremap <leader>p :Files<Cr>
      nnoremap <leader>b :Buffers<Cr>
      nnoremap <leader><TAB> :History<Cr>
      nnoremap <Leader>/ :Rg<Space>
      nnoremap <Leader>h :BCommits<Cr>
    ]])
  end
}
