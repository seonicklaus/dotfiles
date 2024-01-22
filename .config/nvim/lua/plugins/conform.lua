return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			svelte = { { "prettierd", "prettier" } },
			go = { "gofumpt", "goimports", "goimports-reviser", "golines" },
			templ = { "templ" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
		notify_on_error = true,
	},
}
