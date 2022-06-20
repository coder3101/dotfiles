return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- QoL plugins
    use 'nvim-lualine/lualine.nvim'
    -- use 'ful1e5/onedark.nvim'
    use 'marko-cerovac/material.nvim'
    use 'lewis6991/gitsigns.nvim'

    use 'kyazdani42/nvim-tree.lua'
    use 'mbbill/undotree'
    use 'folke/trouble.nvim'
    use "Pocco81/AutoSave.nvim"
    use 'windwp/nvim-autopairs'

    -- Rust QoL
    use 'simrat39/rust-tools.nvim'

    -- its tpope!
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'folke/lsp-colors.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'kyazdani42/nvim-web-devicons'


end)
