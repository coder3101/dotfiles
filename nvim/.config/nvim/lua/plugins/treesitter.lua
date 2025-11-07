return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- Directory to install parsers and queries to
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local languages = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"toml",
				"css",
				"html",
				"svelte",
				"go",
				"jsonnet",
				"graphql",
				"bash",
				"proto",
				"lua",
				"vim",
				"rust",
				"dockerfile",
				"gitignore",
				"python",
				"cpp",
			}

			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					vim.treesitter.start()
				end,
			})

			-- enable folding and indentation based on treesitter
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			-- configuration
			require("nvim-treesitter-textobjects").setup({
				select = {
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
					include_surrounding_whitespace = false,
				},
			})

			-- keymaps
			-- Assignment selections =
			vim.keymap.set({ "x", "o" }, "a=", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
			end, { desc = "Select outer part of an assignment" })
			vim.keymap.set({ "x", "o" }, "i=", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
			end, { desc = "Select inner part of an assignment" })
			vim.keymap.set({ "x", "o" }, "l=", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects")
			end, { desc = "Select LHS of an assignment" })
			vim.keymap.set({ "x", "o" }, "r=", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
			end, { desc = "Select RHS of an assignment" })

			-- Argument selections
			vim.keymap.set({ "x", "o" }, "aa", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
			end, { desc = "Select Outer part of argument" })
			vim.keymap.set({ "x", "o" }, "ia", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
			end, { desc = "Select Inner part of argument" })

			-- Functions/Methods selection
			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end, { desc = "Select Outer part of function" })
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end, { desc = "Select Inner part of function" })

			-- Class selection
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end, { desc = "Select Outer part of class" })
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end, { desc = "Select Inner part of class" })

			-- Loops selection
			vim.keymap.set({ "x", "o" }, "al", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
			end, { desc = "Select Outer part of loops" })
			vim.keymap.set({ "x", "o" }, "il", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
			end, { desc = "Select Inner part of loops" })

			--Conditional selection
			vim.keymap.set({ "x", "o" }, "ai", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
			end, { desc = "Select Outer part of loops" })
			vim.keymap.set({ "x", "o" }, "ii", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
			end, { desc = "Select Inner part of loops" })
		end,
	},
}
