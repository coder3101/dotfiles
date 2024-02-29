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

    use 'tpope/vim-fugitive'
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end
    })

    use 'vim-scripts/ReplaceWithRegister'
    use 'rcarriga/nvim-notify'
    use 'nvim-tree/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'
    use 'mbbill/undotree'
    use 'nvim-treesitter/nvim-treesitter-context'
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use 'folke/trouble.nvim'
    use "Pocco81/auto-save.nvim"

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use "nvim-telescope/telescope-project.nvim"
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "mfussenegger/nvim-lint"
    use "neovim/nvim-lspconfig"
    use "huggingface/llm.nvim"
    use "David-Kunz/gen.nvim"

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    center = {
                        {
                            desc = "Find File",
                            keymap = "",
                            key = "f",
                            icon = "  ",
                            action = "Telescope find_files",
                        },
                        {
                            desc = "Find Project",
                            keymap = "",
                            key = "p",
                            icon = "  ",
                            action = "Telescope project",
                        },
                        {
                            desc = "Recents",
                            keymap = "",
                            key = "r",
                            icon = "  ",
                            action = "Telescope oldfiles",
                        },
                        {
                            desc = "New File",
                            keymap = "",
                            key = "n",
                            icon = "  ",
                            action = "enew",
                        },
                        {
                            desc = "Update Plugins",
                            keymap = "",
                            key = "u",
                            icon = "  ",
                            action = "PackerSync",
                        },
                        {
                            desc = "Manage Extensions",
                            keymap = "",
                            key = "m",
                            icon = "  ",
                            action = "Mason",
                        },
                        {
                            desc = "Config",
                            keymap = "",
                            key = "s",
                            icon = "  ",
                            action = "Telescope find_files cwd=~/.config/nvim",
                        },
                        {
                            desc = "Exit",
                            keymap = "",
                            key = "q",
                            icon = "  ",
                            action = "exit",
                        },
                    },
                    footer = {
                        [[. ,-"-.   ,-"-. ,-"-.   ,-"-. ,-"-.   ,]],
                        [[ X | | \ / | | X | | \ / | | X | | \ / ]],
                        [[/ \| | |X| | |/ \| | |X| | |/ \| | |X| ]],
                        [[   `-!-' `-!-"   `-!-' `-!-'   `-!-' `-]],
                    }
                }
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use "hrsh7th/cmp-nvim-lsp"
    use({
        "nvimdev/lspsaga.nvim",
        after = 'nvim-lspconfig',
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {
                    enable = false,
                },
            })
        end,
    })
    use 'simrat39/rust-tools.nvim'
    use 'onsails/lspkind.nvim'
    -- Copilot related plugins
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-python"
        }
    }
    use 'numToStr/Comment.nvim'

    use 'lewis6991/gitsigns.nvim'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
