-- Bootstrap Packer.nvim so that it is automatically installed
-- On new clones or installation

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

require("plugins")
require("settings")
require("autocommands")
require("autopairs")
require("autosaves")
require("colorschemes")
require("mappings")

require("tree")
require("treesitter")
require("undotree")
require("tscope")
require("lualinenvim")
require("troubley")
require("lsp")
require("gitsign")
