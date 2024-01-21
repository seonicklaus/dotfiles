-- luacheck: globals vim

return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local setmap = vim.keymap.set
		setmap(
			"n",
			"<leader>gsj",
			"<Cmd>GoTagAdd json<CR>",
			{ desc = "Add json struct tags", noremap = true, silent = true }
		)
	end,
	build = function()
		vim.cmd("[[silent! GoInstallDeps]]")
	end,
}
