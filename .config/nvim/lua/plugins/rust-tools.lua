return {
	"simrat39/rust-tools.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	ft = "rust",
	opts = function()
		return require("lua.plugins.settings.rust-tools")
	end,
}
