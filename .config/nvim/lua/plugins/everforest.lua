local enabled = vim.env.THEME == "everforest-dark" or vim.env.THEME == "everforest-light"

return {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
	enabled = enabled,
	config = function()
		require("everforest").setup()

		if vim.env.THEME == "everforest-dark" then
			vim.cmd("set background=dark")
			vim.cmd("colorscheme everforest")
		end

		if vim.env.THEME == "everforest-light" then
			vim.cmd("set background=light")
			vim.cmd("colorscheme everforest")
		end
	end,
}
