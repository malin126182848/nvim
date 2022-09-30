local M = {}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "   toggle shade.nvim",
    },
  },
}

M.navigation = {
  n = {
    ["H"] = { "^", "beginning of line"},
    ["L"] = { "$", "end of line"},
  }

}

M.lspconfig = {
  n = {
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "lsp hover" },
    ["<leader>lh"] = {
      function()
        local buf = vim.api.nvim_get_current_buf()
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == "c" or ft == "cpp" then
          vim.cmd [[ClangdSwitchSourceHeader]]
        end
      end,
      "Switch Source Header",
    },
  },
}

M.dap = {
  n = {
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<CR>", "dap continue" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.step_over()<CR>", "dap step over" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<CR>", "dap step into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_out()<CR>", "dap step out" },
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "dap toggle breakpoint" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.open()<CR>" , "dap repl open" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<CR>" , "dap run last" },
  }
}

return M
