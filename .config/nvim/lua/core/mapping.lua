-- luacheck: globals vim

local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

-- Back to Netrw
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Delete buffers
keymap("n", "<leader>q", vim.cmd.Bdelete)

-- Move half screen cursor center
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Search term in middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Copy to system clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)

-- Format code
keymap("n", "<leader>f", vim.lsp.buf.format)

-- Delete without registry
keymap({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Switch Directory
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quick Fix navigation
keymap("n", "<C-,>", "<cmd>cnext<CR>zz")
keymap("n", "<C-.>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Hover word and replace
keymap("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Insert --
-- Press Ctrl-C to exit mode
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Visual Block --
-- Paste without register deleted
keymap("x", "<leader>p", [["_dP]], opts)

-- Plugins Mapping --
-- Telescope --
keymap("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, opts)
keymap("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, opts)
keymap("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, opts)
keymap("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, opts)
keymap("n", "<leader>fs", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, opts)
keymap("n", "<leader>fo", function()
	require("telescope.builtin").lsp_document_symbols()
end, opts)
keymap("n", "<leader>fi", function()
	require("telescope.builtin").lsp_incoming_calls()
end, opts)
keymap("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Neo Tree --
keymap("n", "<C-n>", "<Cmd>Neotree toggle<CR>", opts)

-- Lint --
keymap("n", "<leader>tl", function()
	require("lint").try_lint()
end, opts)

-- UFO --
keymap("n", "zR", function()
	require("ufo").openAllFolds()
end, { desc = "Open all folds", noremap = true, silent = true })
keymap("n", "zM", function()
	require("ufo").closeAllFolds()
end, { desc = "Close all folds", noremap = true, silent = true })
keymap("n", "zK", function()
	local winId = require("ufo").peekFoldedLinesUnderCursor()
	if not winId then
		vim.lsp.buf.hover()
	end
end, { desc = "Peek fold", noremap = true, silent = true })

-- Oil --
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory", noremap = true, silent = true })

-- Lazygit --
keymap("n", "<leader>gg", "<Cmd>LazyGit<CR>", { desc = "Open LazyGit", noremap = true, silent = true })

-- Creates --
keymap("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "Update all crates", noremap = true, silent = true })
