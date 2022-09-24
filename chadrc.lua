local M = {}

M.plugins = require("custom.plugins")

M.ui = {
  -- theme stuff
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  transparency = false,
  -- highlight groups!
  hl_add = require("custom.highlights").add,
  hl_override = require("custom.highlights").override,
}

M.mappings = require("custom.mappings")

return M
