-- luacheck: globals vim

return {
	"mrcjkb/rustaceanvim",
	version = "^3", -- Recommended
	ft = { "rust" },
	config = function()
		local config = require("plugins.settings.rustaceanvim")

		vim.g.rustaceanvim = {
			server = {
				on_attach = config.on_attach,
				settings = {
					["rust-analyzer"] = {
						cargo = {
							features = "all",
						},
					},
				},
			},
		}
	end,
}
