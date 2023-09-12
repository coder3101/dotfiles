local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indents
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
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

opt.pumheight = 15
opt.ruler = true
opt.cmdheight = 2
opt.mouse = "a"

opt.backup = false
opt.writebackup = false

opt.updatetime = 300
opt.timeoutlen = 500
opt.scrolloff = 8

opt.hidden = true
opt.hlsearch = false
opt.undofile = true
opt.shortmess:append({ I = true })

opt.iskeyword:append("-")
