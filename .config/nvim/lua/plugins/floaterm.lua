vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.floaterm_autoclose = 1

return {
  "voldikss/vim-floaterm",
  config = function ()
    vim.keymap.set('n', '<C-t>', ':FloatermToggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tt', ':FloatermNew<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>t]', ':FloatermNext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>t[', ':FloatermPrev<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>tw', ':FloatermKill<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-g>', ':FloatermNew lazygit<CR>', { noremap = true, silent = true })
  end
}
