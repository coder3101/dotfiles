return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		{ "fredrikaverpil/neotest-golang", version = "*" },
		-- "rouge8/neotest-rust",
		{ "mrcjkb/rustaceanvim", version = "^6", lazy = false },
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			discovery = {
				-- Drastically improve performance in ginormous projects by
				-- only AST-parsing the currently opened buffer.
				enabled = false,
			},
			adapters = {
				require("neotest-golang")({
					go_test_args = { "-v", "-race", "-count=1", "-timeout=90s" },
				}),
				require("neotest-python"),
				-- require("neotest-rust"),
				require("rustaceanvim.neotest"),
			},
		})
		vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<cr>", { desc = "[T]est [Summary]" })
		vim.keymap.set("n", "<leader>tp", "<cmd>Neotest output-panel<cr>", { desc = "[T]est [P]anel" })
		vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run<cr>", { desc = "[T]est [R]un" })
	end,
}
