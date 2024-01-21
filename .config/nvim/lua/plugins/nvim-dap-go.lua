-- luacheck: globals vim

return {
	"leoluz/nvim-dap-go",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	ft = "go",
	config = function()
		local setmap = vim.keymap.set

		require("dap-go").setup()

		setmap("n", "<leader>gdt", function()
			require("dap-go").debug_test()
		end, { desc = "Debug go test", noremap = true, silent = true })
		setmap("n", "<leader>gdl", function()
			require("dap-go").debug_last()
		end, { desc = "Debug last go test", noremap = true, silent = true })
	end,
}
