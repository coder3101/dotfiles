local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    vim.notify("Coloscheme not found")
    return
end
