local M = {}

M.plugins = require "custom.plugins"

M.ui = {
  -- theme stuff
  theme = "vscode_dark",
  theme_toggle = { "catppuccin_latte", "vscode_dark" },

  transparency = false,
  -- highlight groups!
  hl_add = require("custom.highlights").add,
  hl_override = require("custom.highlights").override,
}

M.mappings = require "custom.mappings"

return M
