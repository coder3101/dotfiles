local mason_lsp_status, mason = pcall(require, "mason")
if not mason_lsp_status then
    vim.notify("Failed to import mason", "error")
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    vim.notify("Failed to import mason lspconfig", "error")
    return
end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "sumneko_lua",
        "gopls",
        "clangd",
        "pyright",
        "rust_analyzer",
        "yamlls",
        "jsonls",
        "dockerls",
        "bashls",
        "svelte",
        "taplo"
    }
})
