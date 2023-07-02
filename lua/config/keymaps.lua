-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.g.vscode then
  vim.keymap.set("n", "<leader>ca", "<cmd>call VSCodeNotify('editor.action.quickFix')<cr>")
  vim.keymap.set("n", "<leader>lh", "<cmd>call VSCodeNotify('clangd.switchheadersource')<cr>")
  vim.keymap.set("n", "<C-j>", "<cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<cr>")
  vim.keymap.set("n", "<C-k>", "<cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<cr>")
  vim.keymap.set("n", "<C-h>", "<cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<cr>")
  vim.keymap.set("n", "<C-l>", "<cmd>call VSCodeNotify('workbench.action.focusRightGroup')<cr>")
end
