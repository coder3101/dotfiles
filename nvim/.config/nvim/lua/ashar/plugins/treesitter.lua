local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("Failed to import treesitter.configs", "error")
    return
end

treesitter.setup({
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = { enable = true },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "toml",
        "css",
        "html",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "rust",
        "dockerfile",
        "gitignore",
        "python",
        "cpp"
    },
    auto_install = true,
})
