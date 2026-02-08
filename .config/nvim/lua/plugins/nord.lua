local enabled = not vim.env.THEME or vim.env.THEME == "nord" or vim.env.THEME == "nord-light"

return {
	"aku11i/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		if vim.env.THEME == "nord-light" then
			vim.o.background = "light"
		else
			vim.o.background = "dark"
		end
		vim.cmd.colorscheme("nord")
		vim.g.airline_theme = "nord_minimal"
	end,
	enabled = enabled,
}
