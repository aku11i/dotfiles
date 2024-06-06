local enabled = vim.env.THEME == "tokyo-night" or vim.env.THEME == "tokyo-night-storm"

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	enabled = enabled,
	config = function()
		vim.cmd("set background=dark")
		vim.g.airline_theme = "night_owl"

		if vim.env.THEME == "tokyo-night" then
			vim.cmd("colorscheme tokyonight-night")
		end

		if vim.env.THEME == "tokyo-night-storm" then
			vim.cmd("colorscheme tokyonight-storm")
		end
	end,
}
