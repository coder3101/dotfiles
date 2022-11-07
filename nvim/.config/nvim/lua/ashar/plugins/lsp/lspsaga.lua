local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    vim.notify("Failed to import lsp saga", "error")
    return
end

saga.init_lsp_saga({
    move_in_saga = { prev = "<S-Tab>", next = "<Tab>" },
    finder_action_keys = {
        open = "<CR>"
    },
    definition_action_keys = {
        edit = "<CR>"
    }
})
