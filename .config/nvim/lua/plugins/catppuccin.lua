local enabled = vim.env.THEME == "catppuccin-frappe"
	or vim.env.THEME == "catppuccin-latte"
	or vim.env.THEME == "catppuccin-macchiato"
	or vim.env.THEME == "catppuccin-mocha"

return {
	"catppuccin/vim",
	lazy = false,
	priority = 1000,
	enabled = enabled,
	config = function()
		if vim.env.THEME == "catppuccin_frappe" then
			vim.cmd("set background=dark")
			vim.cmd("colorscheme catppuccin-frappe")
		end

		if vim.env.THEME == "catppuccin_latte" then
			vim.cmd("set background=light")
			vim.cmd("colorscheme catppuccin-latte")
		end

		if vim.env.THEME == "catppuccin_macchiato" then
			vim.cmd("set background=dark")
			vim.cmd("colorscheme catppuccin-macchiato")
		end

		if vim.env.THEME == "catppuccin_mocha" then
			vim.cmd("set background=dark")
			vim.cmd("colorscheme catppuccin-mocha")
		end
	end,
}
