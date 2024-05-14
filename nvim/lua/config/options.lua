vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.opt.list = true
vim.opt.listchars = "tab:|  ,trail:_,eol:¬,multispace:_   "

vim.opt.smartindent = false
vim.opt.cindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.splitright = true

vim.cmd.colorscheme("gruber-darker")

vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = "[\\]",
	command = "try | echoerr 'Forbidden file name: \\' | endtry",
})

vim.opt.guicursor = "n-v-c-i:block"
