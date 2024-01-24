local M = {}

local function on_attach(client, _)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

M.on_attach = on_attach

return M
