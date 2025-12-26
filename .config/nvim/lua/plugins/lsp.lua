	return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp_caps = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp_caps.default_capabilities(capabilities)
			end
			-- Disable snippet support to match user preference (no snippet engine)
			if capabilities.textDocument
				and capabilities.textDocument.completion
				and capabilities.textDocument.completion.completionItem then
				capabilities.textDocument.completion.completionItem.snippetSupport = false
			end

			-- LSP-only keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							buffer = event.buf,
							noremap = true,
							silent = true,
							desc = desc,
						})
					end

					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "<C-]>", vim.lsp.buf.definition, "Go to definition")
					map("n", "gd", vim.lsp.buf.definition, "Go to definition")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "gi", vim.lsp.buf.implementation, "Implementation")
					map("n", "<Leader>r", vim.lsp.buf.rename, "Rename symbol")
					map("n", "M", vim.diagnostic.goto_prev, "Prev diagnostic")
					map("n", "m", vim.diagnostic.goto_next, "Next diagnostic")
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				severity_sort = true,
				float = { border = "rounded" },
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				settings = {
					typescript = {
						preferences = {
							includeCompletionsForModuleExports = true,
							includeCompletionsWithSnippetText = true,
						},
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
					javascript = {
						preferences = {
							includeCompletionsForModuleExports = true,
							includeCompletionsWithSnippetText = true,
						},
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
						},
					},
				},
			})

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "tailwindcss" },
				automatic_enable = true,
			})
		end,
	},
}
