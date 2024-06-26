return { -- Autocompletion
	"hrsh7th/nvim-cmp",
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

		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noselect" },
			preselect = cmp.PreselectMode.None,

			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				-- ["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				-- ["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
				--
				-- -- Manually trigger a completion from nvim-cmp.
				-- --  Generally you don't need this, because nvim-cmp will display
				-- --  completions whenever it has completion options available.
				-- ['<C-Space>'] = cmp.mapping.complete {},
				-- ['<C-e>'] = cmp.mapping.close(),

				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping.confirm({ select = true }),
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
