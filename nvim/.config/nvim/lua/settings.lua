local cmd = vim.api.nvim_command

cmd("syntax enable")
cmd("lang en_US.UTF-8")

vim.opt.fileencoding = "utf-8"
vim.opt.undofile = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.conceallevel = 0
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.iskeyword:append "-"
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.pumheight = 15
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.smarttab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.diffopt:append "vertical"
vim.g.do_filetype_lua = 1
vim.did_load_filetypes = 0
-- For better completion experiences
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert', 'preview'}

-- Options
vim.o.shortmess = vim.o.shortmess .. "c"

-- treesitter based fold express
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
