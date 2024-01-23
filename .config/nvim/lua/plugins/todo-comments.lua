return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("todo-comments").setup()
	end,
}
