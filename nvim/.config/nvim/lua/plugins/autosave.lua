return {
	"Pocco81/AutoSave.nvim",
	opts = {
		enabled = true,
		trigger_events = { "InsertLeave", "TextChanged" },
		condition = function(buf)
			local fn = vim.fn
			local ftype = vim.fn.getbufvar(buf, "&filetype")

			return (ftype == "rust") and fn.getbufvar(buf, "&modifiable") == 1
		end,
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
	},
}
