return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"rouge8/neotest-rust",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go")({
					experimental = {
						test_table = true,
					},
					args = { "-count=1", "-timeout=90s" },
				}),
				require("neotest-python"),
				require("neotest-rust"),
			},
		})
		vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<cr>", { desc = "[T]est [Summary]" })
		vim.keymap.set("n", "<leader>tp", "<cmd>Neotest output-panel<cr>", { desc = "[T]est [P]anel" })
		vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run<cr>", { desc = "[T]est [R]un" })
	end,
}
