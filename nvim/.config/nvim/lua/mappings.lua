-- Setup leader
vim.keymap.set("n", '<Space>', '<NOP>')
vim.g.mapleader = " "

-- Normal mode remaps
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize -2<cr>")

vim.keymap.set("n", "<C-u>", "<cmd>viwU<Esc>")

vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

 -- Normal mode, leader based remaps
vim.keymap.set("n", "<leader>t", "<cmd>terminal<cr>")
vim.keymap.set("n", "<leader>j", "<cmd>cn<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>cp<cr>")
vim.keymap.set("n", "<leader>gs", "<cmd>G<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<cr>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>Commentary<cr>")
vim.keymap.set("n", "<leader>o", "o<Esc>0_D")
vim.keymap.set("n", "<leader>O", "O<Esc>0_D")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

-- Blackhole remap
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Insert mode remap
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-u>", "<Esc>viwUi")

-- Terminal mode remap
vim.keymap.set("t", "jj", "<C-\\><C-N>")
vim.keymap.set("t", "<C-h>","<C-\\><C-N><C-w>h")
vim.keymap.set("t", "<C-j>","<C-\\><C-N><C-w>j")
vim.keymap.set("t", "<C-k>","<C-\\><C-N><C-w>k")
vim.keymap.set("t", "<C-l>","<C-\\><C-N><C-w>l")

-- Visual Mode remaps
vim.keymap.set("v", "<leader>/", ":Commentary<cr>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Troubly config

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")

-- Nvim tree mapping
vim.keymap.set("n", '<leader>e', "<cmd>NvimTreeToggle<cr>")
