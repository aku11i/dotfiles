vim.g["fern#renderer"] = { "nerdfont" }
vim.g["fern#default_hidden"] = 1

return {
	"lambdalisue/fern.vim",
	config = function()
		vim.keymap.set("n", "<leader>e", ":Fern . -drawer -reveal=% -toggle<CR>", { noremap = true, silent = true })

		vim.api.nvim_create_augroup("fern-custom", {
			clear = true,
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = "fern-custom",
			pattern = "fern",
			callback = function()
				vim.keymap.set("n", "<CR>", "<Plug>(fern-action-open-or-expand)", { buffer = true })
				vim.keymap.set("n", "o", "<Plug>(fern-action-open-or-expand)", { buffer = true })
				vim.keymap.set("n", "<C-l>", "<C-W>l", { buffer = true })
			end,
		})

		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = "fern-custom",
			callback = function()
				vim.cmd("FernDo -stay :FernReveal " .. vim.fn.expand("%"))
			end,
		})
	end,
}
