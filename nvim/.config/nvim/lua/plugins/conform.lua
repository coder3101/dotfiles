return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>=",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			go = { "goimports", "gofmt" },
			markdown = { "prettier" },
		},
		-- -- Set up format-after-save
		format_after_save = function(bufnr)
			-- Disable autoformat on certain filetypes
			local ignore_filetypes = { "rust", "json", "proto", "yaml" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}
