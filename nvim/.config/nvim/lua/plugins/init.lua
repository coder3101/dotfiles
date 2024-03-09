return {
    "tpope/vim-sleuth",   -- Automatically detect and set the 'shiftwidth' and expandtab (or noexpandtab) settings based on the current file/folder
    "tpope/vim-fugitive", -- Git commands in nvim

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            signs = false
        }
    },
}
