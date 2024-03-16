return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tree-sitter-cli",
        "stylua",
        "luacheck",
        "shellcheck",
        "shfmt",
        "markdownlint",
        "cmakelint",
        "hadolint",
      },
    },
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    init = function()
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    opts = {
      inlay_hints = { enabled = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = { prefix = "icons" } },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
}
