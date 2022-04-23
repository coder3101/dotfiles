vim.keymap.set('n', '<leader>ps', function()
    require('telescope.builtin').grep_string({search = vim.fn.input("Grep for Project > ")})
end)

vim.keymap.set('n','<C-p>', function()
    require('telescope.builtin').git_files()
end)

vim.keymap.set('n','<leader>pf', function()
    require('telescope.builtin').find_files()
end)

vim.keymap.set('n','<leader>pw', function()
    require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})
end)

vim.keymap.set('n','<leader>pb', function()
    require('telescope.builtin').buffers()
end)

vim.keymap.set('n','<leader>rc', function()
    require('tscope.extras').neovimrc()
end)

vim.keymap.set('n','<leader>gc', function()
    require('tscope.extras').git_branches()
end)
