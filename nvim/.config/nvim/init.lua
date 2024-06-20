-- Bootstrap lazy.nvim in new machines
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local client = vim.lsp.start_client({
	name = "protols",
	cmd = { vim.fn.expand("$HOME/.cargo/bin/protols") },
})

if not client then
	vim.notify("Could not connect to protols server")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "proto",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
-- Common options
require("common.options")
require("common.keymaps")
require("lazy").setup("plugins")
