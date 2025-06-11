return {
	"mfussenegger/nvim-lint",
	enabled = true,
	config = function()
		-- In a work env, set the config
		if vim.env.CTHULHU_DIR ~= nil then
			require("lint").linters.revive.args = {
				"-formatter",
				"json",
				"-config",
				vim.env.CTHULHU_DIR .. "/docode/src/do/revive.toml",
			}
		end
		require("lint").linters_by_ft = {
			-- rust = { "clippy" },
			go = { "revive" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()
			end,
		})
	end,
}
