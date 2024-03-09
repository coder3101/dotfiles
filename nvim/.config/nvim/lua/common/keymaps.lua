vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jj", "<ESC>")

-- Send every type fo cut into blackhole
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>d", '"_d')
keymap.set("n", "<leader>dp", '"_dp')
keymap.set("n", "c", '"_c')

keymap.set("v", "<leader>x", '"_x')
keymap.set("v", "<leader>d", '"_d')
keymap.set("v", "<leader>dp", '"_dp')
keymap.set("v", "<leader>c", '"_c')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>")
keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>")
keymap.set("n", "<M-Left>", "<cmd>vertical resize +2<cr>")
keymap.set("n", "<M-Right>", "<cmd>vertical resize -2<cr>")

keymap.set("n", "{", "<C-d>")
keymap.set("n", "}", "<C-u>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Terminal mode remap
keymap.set("t", "jj", "<C-\\><C-N>")
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- Normal mode, leader based remaps
keymap.set("n", "<leader>T", "<cmd>terminal<cr>")
keymap.set("n", "<leader>j", "<cmd>cn<cr>")
keymap.set("n", "<leader>k", "<cmd>cp<cr>")
keymap.set("n", "<leader>gs", "<cmd>G<cr>")
keymap.set("n", "<leader>o", "o<Esc>0_D")
keymap.set("n", "<leader>O", "O<Esc>0_D")

-- Visual Mode remaps
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
