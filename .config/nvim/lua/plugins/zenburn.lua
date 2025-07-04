local enabled = vim.env.THEME == "zenburn"

return {
	"phha/zenburn.nvim",
	lazy = false,
	priority = 1000,
	enabled = enabled,
	config = function()
		require("zenburn").setup()
		vim.cmd("set background=dark")
		vim.cmd("colorscheme zenburn")
	end,
}