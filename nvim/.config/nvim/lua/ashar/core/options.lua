local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indents
opt.tabstop = 4
opt.shiftwidth = 4
vim.opt.smarttab = true
opt.expandtab = true
opt.autoindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspaces
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitbelow = true
opt.splitright = true

vim.opt.pumheight = 15
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.mouse = "a"

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.scrolloff = 8

vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.undofile = true

opt.iskeyword:append("-")
