-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("config.options")
  require("config.keymaps")
else
  require("config.lazy")
end
