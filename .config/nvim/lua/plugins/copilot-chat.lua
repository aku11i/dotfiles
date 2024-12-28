return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("CopilotChat").setup({
			model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
			-- window = {
			-- 	layout = "float",
			-- 	width = 0.8,
			-- 	height = 0.8,
			-- 	relative = "editor",
			-- },
			window = {
				layout = "float",
				relative = "cursor",
				width = 1,
				height = 0.4,
				row = 1,
			},
		})

		local chat = require("CopilotChat")

		local prompts = chat.prompts()

		prompts.Explain.prompt = "> /COPILOT_EXPLAIN\n\n選択中の箇所の内容を説明してください。"
		prompts.Review.prompt =
			"> /COPILOT_REVIEW\n\n選択中のコードの内容をレビューしてください。"
		prompts.Fix.prompt =
			"> /COPILOT_GENERATE\n\nこのコードには問題があります。 修正されるように書き直してください。"
		prompts.Optimize.prompt =
			"> /COPILOT_GENERATE\n\n選択中のコードをパフォーマンスと可読性が向上されるように書き直してください。"
		prompts.Docs.prompt = "> /COPILOT_GENERATE\n\nPlease add documentation comment for the selection."
		prompts.Tests.prompt = "> /COPILOT_GENERATE\n\nPlease generate tests for my code."
	end,
}
