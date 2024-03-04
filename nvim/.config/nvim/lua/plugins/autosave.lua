return {
	"Pocco81/AutoSave.nvim",
	opts = {
		enabled = true,
		trigger_events = { "InsertLeave", "TextChanged" },
		condition = function(buf)
			local fn = vim.fn

			-- Save modifiable rust files only
			if
				(fn.getbufvar(buf, "&filetype") == "rust" or fn.getbufvar(buf, "&filetype") == "toml")
				and fn.getbufvar(buf, "&modifiable") == 1
			then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
	},
}
