-- luacheck: globals vim

return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local setmap = vim.keymap.set

		setmap(
			"n",
			"<leader>dt",
			dap.toggle_breakpoint,
			{ desc = "Add breakpoint at line", noremap = true, silent = true }
		)
		setmap("n", "<F5>", dap.continue, { desc = "Debug Continue", noremap = true, silent = true })
		setmap("n", "<F10>", dap.step_over, { desc = "Debug Step Over", noremap = true, silent = true })
		setmap("n", "<F11>", dap.step_into, { desc = "Debug Step Into", noremap = true, silent = true })
		setmap("n", "<F12>", dap.step_out, { desc = "Debug Step Out", noremap = true, silent = true })
		setmap("n", "<leader>dus", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open debugging sidebar", noremap = true, silent = true })
	end,
}
