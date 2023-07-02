-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  vim.keymap.set("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>")
  vim.keymap.set("n", "<leader>lh", "<cmd>call VSCodeNotify('clangd.switchheadersource')<cr>")
end
