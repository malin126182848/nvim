local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return print "Error loading lspconfig"
end

local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = { "html", "cssls", "emmet_ls", "clangd", "cmake", "jsonls", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
}

lspconfig.volar.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine",
      },
      showDocumentation = { enable = true },
    },
    codeActionOnSave = {
      enable = true,
      mode = "problems",
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
      mode = "location",
    },
  },
}

lspconfig.tsserver.setup {
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

M.clangd = function()
  local custom_capabilities = capabilities
  custom_capabilities.offsetEncoding = "utf-16"
  require("clangd_extensions").setup {
    server = {
      cmd = {
        "clangd",
        "--background-index",
        "--offset-encoding=utf-16", -- temporary fix to stop null-ls
        "--enable-config",
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--suggest-missing-includes",
        "--pch-storage=memory",
      },
      -- args = {
      -- },
      on_attach = on_attach,
      capabilities = custom_capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    },
    extensions = {
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },

        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },

        highlights = {
          detail = "Comment",
        },
      },
    },
  }
end

return M
