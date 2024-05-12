return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  config = function ()
    vim.keymap.set('n', '<leader>f', ':Rg<CR>', { noremap = true })
    vim.keymap.set('v', '<leader>f', ':Rg<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>p', ':Files<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>b', ':Buffers<CR>', { noremap = true })
    vim.keymap.set('n', '<leader><TAB>', ':History<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>/', ':Rg<Space>', { noremap = true })
    vim.keymap.set('n', '<leader>h', ':BCommits<CR>', { noremap = true })
  end
}
