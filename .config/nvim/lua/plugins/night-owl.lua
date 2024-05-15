local enabled = vim.env.THEME == "night-owl"

return {
	"haishanh/night-owl.vim",
	config = function()
		vim.cmd("set background=dark")
		vim.cmd("colorscheme night-owl")
		vim.g.airline_theme = "night_owl"
	end,
	enabled = enabled,
}
