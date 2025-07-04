return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	enabled = false,
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"onsails/lspkind-nvim",
	},
	config = function()
		-- See `:help cmp`
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
					-- vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noselect" },
			-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
			preselect = cmp.PreselectMode.None,

			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-j>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-k>"] = cmp.mapping.select_prev_item(),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
				--
				["<C-n>"] = cmp.mapping.scroll_docs(-4),
				["<C-p>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "copilot" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "crates" },
			},

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					symbol_map = { Copilot = "" },
					ellipsis_char = "...",
				}),
			},
		})

		-- Setup up vim-dadbod
		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})
	end,
}
