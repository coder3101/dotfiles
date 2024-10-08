return {
	"mfussenegger/nvim-lint",
	enabled = false,
	config = function()
		require("lint").linters_by_ft = {
			proto = { "buf_lint", "protolint" },
			rust = { "clippy" },
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
