local overrides = require "custom.plugins.overrides"

return {

  ----------------------------------------- default plugins ------------------------------------------

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- override default configs
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  --------------------------------------------- custom plugins ----------------------------------------------

  -- autoclose tags in html, jsx only
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- distraction free modes
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  -- dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require "custom.plugins.shade"
    end,
  },

  -- autosave
  ["Pocco81/AutoSave.nvim"] = {
    module = "autosave",
    config = function()
      require("autosave").setup()
    end,
  },

  -- notes & todo stuff
  ["nvim-neorg/neorg"] = {
    tag = "0.0.12",
    ft = "norg",
    after = "nvim-treesitter",
    setup = function()
      require("custom.plugins.neorg").autocmd()
    end,
    config = function()
      require("custom.plugins.neorg").setup()
    end,
  },

  -- basic diagrams for flow charts etc
  ["jbyuki/venn.nvim"] = {
    module = "venn.nvim",
    config = function()
      require("custom.plugins.venn").setup()
    end,
  },

  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    config = function()
      require "custom.plugins.nvim_dap"
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    module = "dapui",
    after = "nvim-dap",
    config = function()
      require "custom.plugins.nvim_dap_ui"
    end,
  },

  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  ["p00f/clangd_extensions.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.lspconfig").clangd()
    end,
  },

  ["Civitasv/cmake-tools.nvim"] = {
    config = function()
      require "custom.plugins.cmake"
    end,
  },

  ["nmac427/guess-indent.nvim"] = {
    config = function()
      require("guess-indent").setup {}
    end,
  },

  ["sindrets/diffview.nvim"] = {
    requires = { 'nvim-lua/plenary.nvim' },
  },

  ["tanvirtin/vgit.nvim"] = {
    after = "ui",
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("vgit").setup {}
      -- require "custom.plugins.vgit"
    end,
  },

  -- ["anuvyklack/windows.nvim"] = {
  --   requires = {
  --     "anuvyklack/middleclass",
  --     "anuvyklack/animation.nvim"
  --   },
  --   config = function()
  --     vim.o.winwidth = 10
  --     vim.o.winminwidth = 10
  --     vim.o.equalalways = false
  --     require('windows').setup()
  --   end
  -- },
}
