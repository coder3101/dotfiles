local status, notify = pcall(require, "notify")
if not status then
    vim.notify("Failed to import vim notify")
    return
end

notify.setup({
    max_width = 100,
    timeout = 5000,
    top_down = false
})

vim.notify = notify
