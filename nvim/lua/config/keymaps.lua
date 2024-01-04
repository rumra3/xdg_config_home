vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

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
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- tree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- neoterm
vim.keymap.set("n", "<leader>tt", ":NeotermToggle<CR>", {})
vim.keymap.set("n", "<C-x>", ":NeotermExit<CR>", {})

-- zk
local opts = { noremap=true, silent=false }
-- new note
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
	local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
	local opts = { noremap=true, silent=false }

	-- Open the link under the caret.
	map("n", "<leader>zo", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Create a new note after asking for its title.
	-- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
	map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
	-- Create a new note in the same directory as the current buffer, using the current selection for title.
	map("v", "<leader>ztn", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
	map("v", "<leader>ztb", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h'), edit = false }<CR>", opts)
	-- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
	map("v", "<leader>zcn", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)

	-- Open notes linking to the current buffer.
	map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
	-- Alternative for backlinks using pure LSP and showing the source context.
	--map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- Open notes linked by the current buffer.
	map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

	-- Preview a linked note.
	map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- Open the code actions for a visual selection.
	map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
end

-- spider
vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
