local telescope_setup, telescope = pcall(require, "telescope")
require("ashar.plugins.lsp.lspconfig")
if not telescope_setup then
    vim.notify("Failed to import telescope", "error")
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    vim.notify("Failed to import telescope actions", "error")
    return
end

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            }
        },
    },
    extensions = {
        project = {
            sync_with_nvim_tree = true
        }
    }
})

telescope.load_extension("fzf")
telescope.load_extension("project")


local neovimrc = function()
    require('telescope.builtin').find_files({
        prompt_title = "< NeoVimRC >",
        cwd = "~/.config/nvim/"
    })
end

local git_branches = function()
    require('telescope.builtin').git_branches({
        attach_mappings = function(prompt_bufrn, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', 'dd', actions.git_delete_branch)
            return true
        end
    })
end

vim.keymap.set('n', '<leader>pp', function()
    require('telescope').extensions.project.project { display_type = 'full' }
end)


vim.keymap.set('n', '<leader>ps', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for Project > ") })
end)

vim.keymap.set('n', '<leader>pf', function()
    require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<leader>pw', function()
    require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })
end)

vim.keymap.set('n', '<leader>rc', function()
    neovimrc()
end)

vim.keymap.set('n', '<leader>gc', function()
    git_branches()
end)
