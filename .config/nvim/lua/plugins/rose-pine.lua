local enabled = vim.env.THEME == "rose-pine" or vim.env.THEME == "rose-pine-dawn" or vim.env.THEME == "rose-pine-moon"

return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	enabled = enabled,
	config = function()
		if vim.env.THEME == "rose-pine" then
			vim.g.airline_theme = "violet"
			vim.cmd("set background=dark")
			vim.cmd("colorscheme rose-pine")
		end

		if vim.env.THEME == "rose-pine-dawn" then
			vim.g.airline_theme = "solarized"
			vim.cmd("set background=light")
			vim.cmd("colorscheme rose-pine-dawn")
		end

		if vim.env.THEME == "rose-pine-moon" then
			vim.g.airline_theme = "violet"
			vim.cmd("set background=dark")
			vim.cmd("colorscheme rose-pine-moon")
		end
	end,
}
