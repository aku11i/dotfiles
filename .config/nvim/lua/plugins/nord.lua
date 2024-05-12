local enabled = not vim.env.THEME or vim.env.THEME == "nord"

return {
	"arcticicestudio/nord-vim",
	config = function()
		vim.cmd("colorscheme nord")
	end,
	enabled = enabled,
}
