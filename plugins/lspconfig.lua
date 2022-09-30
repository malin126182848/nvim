local lspconfig = require("lspconfig")
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local custom = require("custom.plugins.lsp.custom")
local servers = { "html", "cssls", "emmet_ls", "clangd", "cmake", "jsonls", "tsserver" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

custom["lua"]()
custom["vue"]()
custom["lua"]()
