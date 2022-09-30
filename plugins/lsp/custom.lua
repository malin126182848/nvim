local M = {}

local lspconfig    = require("lspconfig")
local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local custom_servers = {
	"lua",
	"python",
	"js",
  "clangd",
	"vue",
	"eslint",
}

M.lua = function()
	lspconfig.sumneko_lua.setup({
		on_attach = attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				telemetry = {
					enable = false
				}
			}
		}
	})
end

M.python = function()
	lspconfig.pyright.setup({
		on_attach = attach,
		capabilities = capabilities,
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
				}
			}
		}
	})
end

M.js = function()
	lspconfig.tsserver.setup({
		init_options = {
			hostInfo = "neovim",
		},
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			attach(client, bufnr)
		end,
		capabilities = capabilities,
	})
end

M.clangd = function()
	local custom_capabilities = capabilities
	custom_capabilities.offsetEncoding = "utf-16"
	require("clangd_extensions").setup({
		server = {
			cmd = {
				"clangd",
				"--background-index",
				"--offset-encoding=utf-16", -- temporary fix to stop null-ls
				"--enable-config",
				"--completion-style=detailed",
				"--clang-tidy",
				"--all-scopes-completion",
				"--pch-storage=memory",
				"--suggest-missing-includes",
			},
			-- args = {
			-- },
			on_attach = attach,
			capabilities = custom_capabilities,
			flags = {
				debounce_text_changes = 150,
			},
		},
		extensions = {
			autosetHint = true,
			inlay_hints = {
				highlight = "DiagnosticInfo",
			},
			ast = {
				type = "",
			},
		}
	})
end

M.vue = function()
	lspconfig.volar.setup({
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			attach(client, bufnr)
		end,
		capabilities = capabilities
	})
end

M.eslint = function()
	lspconfig.eslint.setup({
		on_attach = function(client, bufnr)
			attach(client, bufnr)
		end,
		settings = {
			codeAction = {
				disableRuleComment = {
					enable = true,
					location = "separateLine"
				},
				showDocumentation = { enable = true }
			},
			codeActionOnSave = {
				enable = true,
				mode = "problems"
			},
			format = true,
			nodePath = "",
			onIgnoredFiles = "off",
			packageManager = "npm",
			quiet = false,
			rulesCustomizations = {},
			run = "onSave",
			useESLintClass = true,
			validate = "on",
			workingDirectory = {
				mode = "location"
			}
		}
	})

end

M.setup = function()
	for _, server in pairs(custom_servers) do
		M[server]()
	end
end

return M
