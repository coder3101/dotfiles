return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-go",
		"mrcjkb/rustaceanvim",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go")({
					args = { "-count=1", "-timeout=30s" },
				}),
				require("neotest-python"),
				require("rustaceanvim.neotest"),
			},
		})
		vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<cr>", { desc = "[T]est [Summary]" })
		vim.keymap.set("n", "<leader>tp", "<cmd>Neotest output-panel<cr>", { desc = "[T]est [P]anel" })
		vim.keymap.set("n", "<leader>tr", "<cmd>Neotest run<cr>", { desc = "[T]est [R]un" })
	end,
}
