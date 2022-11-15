local status, troubly = pcall(require, "trouble")
if not status then
    vim.notify("Failed to load troubly", "error")
    return
end

troubly.setup()

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
