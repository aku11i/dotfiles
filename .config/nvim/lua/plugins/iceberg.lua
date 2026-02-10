local enabled = vim.env.THEME == "iceberg" or vim.env.THEME == "iceberg-light"

return {
	"oahlen/iceberg.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		if vim.env.THEME == "iceberg-light" then
			vim.cmd("set background=light")
		else
			vim.cmd("set background=dark")
		end
		vim.cmd("colorscheme iceberg")
	end,
	enabled = enabled,
}
