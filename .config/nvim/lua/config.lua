-- Set default shell
vim.o.shell = "fish"

vim.o.termguicolors = true

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
vim.cmd("syntax enable")

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
vim.o.autoread = true

-- Search-related options
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.wrapscan = true

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")

-- Set options
vim.opt.splitbelow = true
vim.opt.splitright = true
