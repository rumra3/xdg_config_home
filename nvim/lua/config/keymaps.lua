vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ov", vim.cmd.Ex)
vim.keymap.set("n", "<Space>", "<NOP>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set({"n", "i", "v"}, "<C-s>", ":update<CR>")

-- copipe
vim.keymap.set({"v", "n"}, "<leader>y", '"+y')
vim.keymap.set("v", "<leader>Y", '"+yg_')
vim.keymap.set({"v", "n"}, "<leader>p", '"+p')
vim.keymap.set({"v", "n"}, "<leader>P", '"+P')

-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-[>", "<Esc>")
vim.keymap.set("t", "<M-Esc>", "<Esc>")

vim.keymap.set("t", "<M-h>", "<C-\\><C-n><cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><cmd>TmuxNavigateDown<cr>")
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><cmd>TmuxNavigateUp<cr>")
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><cmd>TmuxNavigateRight<cr>")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>0", function() ui.nav_file(10) end)
-- shifted numberbar
vim.keymap.set("n", "<leader>!", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>@", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>#", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>$", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>%", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>^", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>&", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>*", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>(", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>)", function() ui.nav_file(10) end)

-- lsp
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- neowords

local neowords = require("neowords")
local p = neowords.pattern_presets

local hops = neowords.get_word_hops(
  p.snake_case,
  p.camel_case,
  p.upper_case,
  p.number,
  p.hex_color
)

-- nvim-surround

require('nvim-surround').setup({
	keymaps = {
		normal          = 'gz',
		normal_cur      = 'gZ',
		normal_line     = 'gzgz',
		normal_cur_line = 'gZgZ',
		visual          = 'gz',
		visual_line     = 'gZ',
		delete          = 'gzd',
		change          = 'gzc',
	}
})
