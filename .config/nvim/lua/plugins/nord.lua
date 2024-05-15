local enabled = not vim.env.THEME or vim.env.THEME == "nord"

return {
	"arcticicestudio/nord-vim",
	config = function()
		vim.cmd("set background=dark")
		vim.cmd("colorscheme nord")
		vim.g.airline_theme = "nord_minimal"
	end,
	enabled = enabled,
}
