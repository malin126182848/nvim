-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
local override = require "custom.override"

M.plugins = {

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
  },

  user = require "custom.plugins",
}


M.ui = {
  theme = "gruvchad",
  hl_add = require "custom.highlights",
  theme_toggle = {"gruvchad", "gruvbox_light"},
}

M.mappings = require "custom.mappings"

return M
