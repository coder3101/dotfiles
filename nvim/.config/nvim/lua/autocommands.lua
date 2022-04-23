-- Creating an autocommand in 0.7
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback =  function()
        vim.lsp.buf.formatting_sync(nil, 200)
    end,
    desc = "Rust auto formatted",
})
