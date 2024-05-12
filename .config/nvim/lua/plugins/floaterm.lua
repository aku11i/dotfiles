return {
  "voldikss/vim-floaterm",
  config = function ()
    vim.cmd([[
      let g:floaterm_width = 0.9
      let g:floaterm_height = 0.9
      let g:floaterm_autoclose = 1
      nnoremap <silent> <C-t> :FloatermToggle<Cr>
      nnoremap <silent> <leader>tt :FloatermNew<Cr>
      nnoremap <silent> <leader>t] :FloatermNext<Cr>
      nnoremap <silent> <leader>t[ :FloatermPrev<Cr>
      nnoremap <silent> <leader>tw :FloatermKill<Cr>
      nnoremap <silent> <C-g> :FloatermNew lazygit<Cr>
    ]])
  end
}
