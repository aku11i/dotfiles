-- Set default shell
vim.o.shell = "fish"

-- Appearance settings
vim.o.title = true
vim.o.hidden = true
vim.o.cmdheight = 2
vim.o.laststatus = 2
vim.o.showcmd = true
vim.o.number = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0
vim.o.ruler = true
vim.o.list = true
vim.o.listchars = "tab:>-,trail:_,extends:<"
vim.o.showmatch = true

-- Enable syntax highlighting
vim.cmd "syntax enable"

-- Global options
vim.o.encoding = "utf-8"
vim.o.mouse = "a"
vim.o.wildmenu = true
vim.o.backspace = "indent,eol,start"
vim.o.smartindent = true
vim.o.updatetime = 300 -- Default is 4000
vim.o.clipboard = "unnamed"
vim.o.formatoptions = vim.o.formatoptions .. "mM"
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = false

-- Search-related options
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.wrapscan = true

-- Enable filetype plugins and indentation
vim.cmd "filetype plugin indent on"

-- Set options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Spacebar as the leader key
vim.g.mapleader = " "

-- Key mappings
vim.keymap.set('', ';', ':', { noremap = true })
vim.keymap.set('n', '<ESC><ESC>', ':nohl<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '{', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '}', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>[', ':bprev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>w', ':bdelete<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>W', ':bdelete!<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', '<Home>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-e>', '<End>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-n>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-p>', '<Up>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-b>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-f>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<BS>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>-', ':sp<CR>', { noremap = true })
vim.keymap.set('n', '<C-w>\\', ':vs<CR>', { noremap = true })
vim.keymap.set('n', '<M->', ':sp<CR>', { noremap = true })
vim.keymap.set('n', '<M-\\>', ':vs<CR>', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
vim.keymap.set('n', '<M-j>', '<C-w>-', { noremap = true })
vim.keymap.set('n', '<M-k>', '<C-w>+', { noremap = true })
vim.keymap.set('n', '<M-l>', '<C-w>>', { noremap = true })
vim.keymap.set('n', '<M-h>', '<C-w><', { noremap = true })
vim.keymap.set('n', '<M-r>', '<C-w>=', { noremap = true })
vim.keymap.set('n', '<M-a>', '<C-w>_<C-w>|', { noremap = true })
vim.keymap.set('t', '\\', '<C-\\><C-n>', { noremap = true, silent = true })

-- Terminal autocmd
vim.cmd [[
  autocmd TermOpen term://* startinsert
]]
