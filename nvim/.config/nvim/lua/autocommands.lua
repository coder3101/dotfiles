-- Autocommand to for rust-tool
vim.api.nvim_exec([[
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false }) 
    autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
]], false)
