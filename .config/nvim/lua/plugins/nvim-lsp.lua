-- luacheck: globals vim

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- LSP Management
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Status update for LSP
		{ "j-hui/fidget.nvim", opts = {} },
		{ "folke/neodev.nvim" },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"golangci_lint_ls",
				"gopls",
				"html",
				"htmx",
				"jsonls",
				"rust_analyzer",
				"sqlls",
				"svelte",
				"tailwindcss",
				"templ",
				"tsserver",
			},
		})

		local lspconfig = require("lspconfig")

		local function lsp_keymaps(bufnr)
			local setmapping = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }
			setmapping(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			setmapping(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			setmapping(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			setmapping(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			setmapping(bufnr, "n", "<C-i>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			-- setmapping(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
			setmapping(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			setmapping(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
			setmapping(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			setmapping(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
			setmapping(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			setmapping(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
			setmapping(bufnr, "n", "<leader>c", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		end

		local function on_attach(_, bufnr)
			lsp_keymaps(bufnr)
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				if server_name == "rust_analyzer" then
					return
				end

				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				local require_ok, conf_opts = pcall(require, "plugins.settings." .. server_name)
				if require_ok then
					opts = vim.tbl_deep_extend("force", conf_opts, opts)
				end

				lspconfig[server_name].setup(opts)
			end,
		})
	end,
}
