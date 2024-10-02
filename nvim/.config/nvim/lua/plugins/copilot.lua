return {
	{
		"zbirenbaum/copilot.lua",
		enabled = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					keymap = {
						accept = "ja",
						next = "jn",
						previous = "jp",
						dismiss = "jc",
					},
				},
				panel = { enabled = false },
			})

			local cmp = require("cmp")
			local ai = require("copilot.suggestion")

			cmp.event:on("menu_opened", function()
				vim.b.copilot_suggestion_hidden = true
			end)

			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
