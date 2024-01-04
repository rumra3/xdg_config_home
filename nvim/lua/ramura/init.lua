require("ramura.remap")
require("ramura.packer")

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

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 5

vim.opt.signcolumn = "yes"

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
