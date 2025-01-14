return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{
			"<leader>gs",
			"<cmd>Neogit kind=split_below<cr>",
			desc = "[G]it [s]tatus",
		},
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({
			mappings = {
				popup = {
					["l"] = false,
				},
				status = {
					["l"] = "Toggle",
					["<tab>"] = false,
				},
				finder = {
					["<c-j>"] = "Next",
					["<c-k>"] = "Previous",
				},
			},
		})
	end,
}
