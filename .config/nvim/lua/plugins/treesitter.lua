return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		auto_install = true, -- automatically install syntax support when entering new file type buffer
		ensure_installed = {
			"vim",
			"regex",
			"lua",
			"bash",
			"markdown",
			"markdown_inline",
		},
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
			filetypes = { "html", "javascript", "typescript", "svelte", "php" },
		},
	},
	config = function(_, opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
}
