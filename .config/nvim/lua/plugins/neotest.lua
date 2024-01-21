-- luacheck: globals vim

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	ft = { "go" },
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
			},
		})

		local setmap = vim.keymap.set

		setmap("n", "<leader>tt", function()
			require("neotest").run.run()
		end, { desc = "Run test", noremap = true, silent = true })
		setmap("n", "<leader>to", function()
			require("neotest").output.open()
		end, { desc = "Show test output", noremap = true, silent = true })
		setmap("n", "<leader>tO", function()
			require("neotest").output.open({ enter = true })
		end, { desc = "Show and enter test output window", noremap = true, silent = true })
	end,
}
