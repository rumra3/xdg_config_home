require("ramura.remap")
require("ramura.packer")

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 5

vim.opt.signcolumn = "yes"

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function map_i(lhs, rhs, opts)
    map('i', lhs, rhs, opts)
end

--[[
map_i('"', '""<left>')
---map_i("'", "''<left>")
map_i('(', '()<left>')
map_i('[', '[]<left>')
map_i('{', '{}<left>')
map_i('(<CR>', '(<CR>)<ESC>O<TAB>')
map_i('[<CR>', '[<CR>]<ESC>O<TAB>')
map_i('{<CR>', '{<CR>}<ESC>O<TAB>')
map_i('{;<CR>', '{<CR>};<ESC>O<TAB>')
]]--

