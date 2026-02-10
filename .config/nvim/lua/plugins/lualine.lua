return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	priority = 900,
	config = function()
		vim.opt.laststatus = 2
		require("lualine").setup({
			options = {
				theme = vim.g.lualine_theme or "auto",
				icons_enabled = true,
			},
			tabline = {
				lualine_a = { "buffers" },
				lualine_z = { "tabs" },
			},
		})
	end,
}
