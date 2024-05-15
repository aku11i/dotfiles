local enabled = vim.env.THEME == "solarized-dark" or vim.env.THEME == "solarized-light"

return {
	"lifepillar/vim-solarized8",
	config = function()
		if vim.env.THEME == "solarized-light" then
			vim.cmd("set background=light")
		else
			vim.cmd("set background=dark")
		end

		vim.cmd("colorscheme solarized8_flat")
		vim.g.airline_theme = "solarized"
	end,
	enabled = enabled,
}
