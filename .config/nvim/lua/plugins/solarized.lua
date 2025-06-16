local enabled = vim.env.THEME == "solarized-dark" or vim.env.THEME == "solarized-light"

return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
		variant = "autumn", -- "spring" | "summer" | "autumn" | "winter" (default)
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		if vim.env.THEME == "solarized-light" then
			vim.o.background = "light"
		else
			vim.o.background = "dark"
		end
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
		vim.g.airline_theme = "solarized"
	end,
	enabled = enabled,
}
