-- Bootstrap Packer.nvim so that it is automatically installed
-- On new clones or installation

-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--     execute 'packadd packer.nvim'
-- end

-- require("plugins")
-- require("settings")
-- require("autocommands")
-- require("autopairs")
-- require("autosaves")
-- require("colorschemes")
-- require("mappings")

-- require("tree")
-- require("treesitter")
-- require("undotree")
-- require("tscope")
-- require("lualinenvim")
-- require("troubley")
-- require("lsp")
-- require("gitsign")


require("ashar.plugins-setup")
require("ashar.core.options")
require("ashar.core.keymaps")
require("ashar.core.colorscheme")

require("ashar.plugins.treesitter")
require("ashar.plugins.notify")
require("ashar.plugins.nvim-tree")
require("ashar.plugins.nvim-cmp")
require("ashar.plugins.lualine")
require("ashar.plugins.telescope")
require("ashar.plugins.lsp.mason")
require("ashar.plugins.lsp.lspsaga")
require("ashar.plugins.lsp.lspconfig")
require("ashar.plugins.lsp.lspconfig")
require("ashar.plugins.autopairs")
require("ashar.plugins.autosave")
require("lua.ashar.plugins.gitsigns")

