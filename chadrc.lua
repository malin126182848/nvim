-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

local userPlugins = require "custom.plugins"

M.ui = {
   -- theme = "gruvchad",
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.configs.lspconfig"
    }
  },

  install = userPlugins
}

return M
