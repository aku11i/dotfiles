vim.g.airline_powerline_fonts = 1
vim.g["airline#extensions#tabline#enabled"] = 1

vim.cmd("set laststatus=2")

return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
	},
}
