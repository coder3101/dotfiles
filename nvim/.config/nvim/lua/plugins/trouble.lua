return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
        vim.keymap.set("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
        vim.keymap.set("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
        vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
        vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
    end,
}
