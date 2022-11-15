local status, notify = pcall(require, "notify")
if not status then
    vim.notify("Failed to import vim notify")
    return
end

vim.notify = notify
