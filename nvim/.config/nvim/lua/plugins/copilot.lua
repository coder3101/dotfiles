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
						accept = "<C-y>",
						dismiss = "<C-x>",
					},
				},
				panel = { enabled = false },
			})

			-- local cmp = require("cmp")
			local ai = require("copilot.suggestion")

			-- cmp.event:on("menu_opened", function()
			-- 	vim.b.copilot_suggestion_hidden = true
			-- end)
			--
			-- cmp.event:on("menu_closed", function()
			-- 	vim.b.copilot_suggestion_hidden = false
			-- end)

			vim.keymap.set("n", "<leader>ai", ai.toggle_auto_trigger, { desc = "Enable [A][I] auto suggestion" })
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
