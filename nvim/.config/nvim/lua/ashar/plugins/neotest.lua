require("neotest").setup({
    adapters = {
        require("neotest-go")({
            args = { "-count=1", "-timeout=60s" }
        }),
        require("neotest-python"),
        require("neotest-rust"),
    },
})

vim.keymap.set("n", "<leader>s", "<cmd>Neotest summary<cr>")
vim.keymap.set("n", "<leader>zz", "<cmd>Neotest output-panel<cr>")
vim.keymap.set("n", "<leader>rr", "<cmd>Neotest run<cr>")
