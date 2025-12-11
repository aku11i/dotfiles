vim.g.coc_global_extensions = {
	"coc-tsserver",
	"coc-html",
	"coc-css",
	"coc-json",
	"coc-lists",
	"coc-highlight",
	"coc-yaml",
	"coc-git",
	"coc-go",
	"coc-deno",
	"coc-sumneko-lua",
	"coc-stylua",
	"coc-prisma",
	"@yaegassy/coc-tailwindcss3",
}

return {
	"neoclide/coc.nvim",
	branch = "release",
	config = function()
		-- https://github.com/xiyaowong/coc-stylua/issues/4#issuecomment-1210675034
		os.execute("mkdir -p ~/.config/coc/extensions/coc-stylua-data")

		-- Show documentation in preview window
		local function show_documentation()
			if vim.bo.filetype == "vim" or vim.bo.filetype == "help" then
				vim.cmd("h " .. vim.fn.expand("<cword>"))
			else
				vim.fn.CocActionAsync("doHover")
			end
		end

		vim.keymap.set("n", "<C-]>", "<Plug>(coc-definition)", { noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>r", "<Plug>(coc-rename)", { noremap = true, silent = true })
		vim.keymap.set("n", "K", show_documentation, { noremap = true, silent = true })
		vim.keymap.set("n", "M", "<Plug>(coc-diagnostic-prev)", { noremap = true, silent = true })
		vim.keymap.set("n", "m", "<Plug>(coc-diagnostic-next)", { noremap = true, silent = true })

		-- nnoremap [Coc] <Nop>
		vim.keymap.set("n", "[Coc]", "<Nop>", { noremap = true })
		-- nmap <Leader>c [Coc]
		vim.keymap.set("n", "<Leader>c", "[Coc]", { noremap = true })
		-- nmap [Coc]d <Plug>(coc-definition)
		vim.keymap.set("n", "[Coc]d", "<Plug>(coc-definition)", { noremap = true })
		-- nmap [Coc]t <Plug>(coc-type-definition)
		vim.keymap.set("n", "[Coc]t", "<Plug>(coc-type-definition)", { noremap = true })
		-- nmap [Coc]i <Plug>(coc-implementation)
		vim.keymap.set("n", "[Coc]i", "<Plug>(coc-implementation)", { noremap = true })
		-- nmap [Coc]r <Plug>(coc-references)
		vim.keymap.set("n", "[Coc]r", "<Plug>(coc-references)", { noremap = true })
		-- nmap [Coc]f  <Plug>(coc-format-selected)
		vim.keymap.set("n", "[Coc]f", "<Plug>(coc-format-selected)", { noremap = true })
		-- vmap [Coc]f  <Plug>(coc-format-selected)
		vim.keymap.set("v", "[Coc]f", "<Plug>(coc-format-selected)", { noremap = true })
		-- nmap [Coc]p <Plug>(coc-diagnostic-prev)
		vim.keymap.set("n", "[Coc]p", "<Plug>(coc-diagnostic-prev)", { noremap = true })
		-- nmap [Coc]n <Plug>(coc-diagnostic-next)
		vim.keymap.set("n", "[Coc]n", "<Plug>(coc-diagnostic-next)", { noremap = true })
		-- nnoremap [Coc]o  :<C-u>CocList outline<cr>
		vim.keymap.set("n", "[Coc]o", ":<C-u>CocList outline<CR>", { noremap = true })
		-- nnoremap [Coc]s  :<C-u>CocList -I symbols<cr>
		vim.keymap.set("n", "[Coc]s", ":<C-u>CocList -I symbols<CR>", { noremap = true })
		vim.keymap.set("n", "[Coc]k", show_documentation, { noremap = true })
		vim.keymap.set("n", "[Coc].", "<Plug>(coc-fix-current)", { noremap = true })
		vim.keymap.set("n", "<Leader>.", "<Plug>(coc-fix-current)", { noremap = true })

		-- Highlight symbol and show documentation under cursor on CursorHold
		vim.api.nvim_create_autocmd("CursorHold", {
			pattern = "*",
			callback = function()
				vim.fn.CocActionAsync("highlight")
			end,
		})

		-- Select sugestion
		local opts = { noremap = true, silent = true, expr = true, replace_keycodes = false }
		vim.keymap.set("i", "<C-n>", 'coc#pum#visible() ? coc#pum#next(1) : "<C-n>"', opts)
		vim.keymap.set("i", "<C-p>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-p>"', opts)
		vim.keymap.set("i", "<down>", 'coc#pum#visible() ? coc#pum#next(0) : "<down>"', opts)
		vim.keymap.set("i", "<up>", 'coc#pum#visible() ? coc#pum#prev(0) : "<up>"', opts)
		vim.keymap.set("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(0) : "<Tab>"', opts)
		vim.keymap.set("i", "<S-Tab>", 'coc#pum#visible() ? coc#pum#prev(0) : "<S-Tab>"', opts)
		vim.keymap.set("i", "<ESC>", 'coc#pum#visible() ? coc#pum#cancel() : "<ESC>"', opts)
		vim.keymap.set("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<CR>"', opts)

		-- Scroll suggestion
		vim.keymap.set("i", "<C-f>", 'coc#pum#visible() ? coc#pum#scroll(1) : "<C-e>"', opts)
		vim.keymap.set("i", "<C-b>", 'coc#pum#visible() ? coc#pum#scroll(0) : "<C-y>"', opts)

		-- Scroll help
		vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
		vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

		-- Git
		vim.keymap.set("n", "[g", "<Plug>(coc-git-prevchunk)", { noremap = true, silent = true })
		vim.keymap.set("n", "]g", "<Plug>(coc-git-nextchunk)", { noremap = true, silent = true })

		vim.api.nvim_create_user_command("GitCopyUrl", "CocCommand git.copyUrl", { nargs = 0 })
		vim.api.nvim_create_user_command("GitOpenUrlInBrowser", "CocCommand git.browserOpen", { nargs = 0 })
	end,
}
