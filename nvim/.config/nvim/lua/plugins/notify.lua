return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		require("notify").setup({
			max_width = 100,
			stages = "fade",
			timeout = 5000,
			top_down = false,
			background_colour = "#2d2d2d",
		})
		vim.notify = require("notify")
	end,
}
