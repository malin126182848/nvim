return {
  { "williamboman/nvim-lsp-installer" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.configs.null-ls").setup()
    end,
  },
}
