local function on_attach(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}

return opts
