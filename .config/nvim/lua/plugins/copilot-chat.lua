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

		prompts.Explain.prompt = "/COPILOT_EXPLAIN 選択中の箇所の内容を説明してください。"
		prompts.Review.prompt = "/COPILOT_REVIEW 選択中のコードの内容をレビューしてください。"
		prompts.Fix.prompt =
			"/COPILOT_GENERATE このコードには問題があります。 修正されるように書き直してください。"
		prompts.Optimize.prompt =
			"/COPILOT_GENERATE 選択中のコードをパフォーマンスと可読性が向上されるように書き直してください。"
		prompts.Docs.prompt = "/COPILOT_GENERATE Please add documentation comment for the selection."
		prompts.Tests.prompt = "/COPILOT_GENERATE Please generate tests for my code."
		prompts.FixDiagnostic.prompt = "Please assist with the following diagnostic issue in file:"
		prompts.Commit.prompt =
			"Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit."
		prompts.CommitStaged.prompt =
			"Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit."
	end,
}
