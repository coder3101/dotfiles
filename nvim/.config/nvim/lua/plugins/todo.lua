return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = {
				icon = " ",
				color = "info",
				alt = { "TODO ashar", "TODO coder3101" },
			},
		},
	},
	keys = {
		{
			"<leader>st",
			"<cmd>TodoTelescope<cr>",
			desc = "[S]earch [T]odo",
		},
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
}
