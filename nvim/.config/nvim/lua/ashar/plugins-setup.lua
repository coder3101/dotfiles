local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()
-- Autocommand that reloads neovim whenever save the setup file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, _ = pcall(require, "packer")
if not status then
    return
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use 'bluz71/vim-nightfly-guicolors'

    use 'christoomey/vim-tmux-navigator'
    use 'szw/vim-maximizer'

    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    use 'vim-scripts/ReplaceWithRegister'
    use 'rcarriga/nvim-notify'
    use 'nvim-tree/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'
    use 'mbbill/undotree'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'folke/trouble.nvim'
    use "Pocco81/auto-save.nvim"

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"

    use "hrsh7th/cmp-nvim-lsp"
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use 'simrat39/rust-tools.nvim'
    use 'onsails/lspkind.nvim'

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use 'numToStr/Comment.nvim'

    use 'lewis6991/gitsigns.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
