local enabled = vim.env.THEME == "night-owl"

return {
	"haishanh/night-owl.vim",
	config = function()
		vim.cmd("set background=dark")
		vim.cmd("colorscheme night-owl")
	end,
	enabled = enabled,
}
