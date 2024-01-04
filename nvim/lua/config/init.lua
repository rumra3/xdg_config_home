-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
		"git", 
		"clone", 
		"--filter=blob:none", 
		"https://github.com/folke/lazy.nvim.git", 
		"--branch=stable", -- latest stable release
         lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.opt.termguicolors = true -- enable 24-bit RGB colors

local spec = {{
    import = "plugins"
}}

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy",
	spec = spec,
	defaults = {
		lazy = false,
	},
	install = {
		colorscheme = { "decay" },
	},
	performance = {
		cache = {
			enabled = true
		}
	},
})

local modules = { "config.options", "config.keymaps" }

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(("error loading %s...\n\n%s"):format(mod,err))
	end
end
