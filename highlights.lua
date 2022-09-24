local M = {}

M.override = {
  Comment = { fg = "yellow", bold = true, italic = true, },
  markdownError = { link = "Normal" },
  Folded = { fg = "blue", },
  LineNr = { fg = "light_grey" },
  CmpBorder = { fg = "orange", },
  CmpDocBorder = { fg = "sun", },
  IndentBlanklineContextChar = { fg = "nord_blue" },
  MatchWord = { bg = "black", fg = "orange", bold = true },

  TelescopeSelection = { bg = "grey_fg2" },
  -- Separator
  WinSeparator = { fg = "white" },
  NvimTreeWinSeparator = { fg = "white" },

  -- For my own statusline
  St_NormalModeSep    = { bg = "statusline_bg", },
  St_InsertModeSep    = { bg = "statusline_bg", },
  St_TerminalModeSep  = { bg = "statusline_bg", },
  St_NTerminalModeSep = { bg = "statusline_bg", },
  St_VisualModeSep    = { bg = "statusline_bg", },
  St_ReplaceModeSep   = { bg = "statusline_bg", },
  St_ConfirmModeSep   = { bg = "statusline_bg", },
  St_CommandModeSep   = { bg = "statusline_bg", },
  St_SelectModeSep    = { bg = "statusline_bg", },

  Type = { fg = "green" },

  -- NvimTree
  NvimTreeGitNew = { fg = "green" },
  NvimTreeGitDirty = { fg = "yellow" },
  NvimTreeGitDeleted = { fg = "red" },

  -- Treesitter
  TSParameter       = { fg = "blue" },
  -- TSKeyword   = { fg = "blue" },
  TSVariable        = { fg = "cyan" },
  TSKeywordReturn   = { fg = "base0E" },
  TSKeywordFunction = { fg = "teal" },

}

M.add = {
  -- By default NvChad doesn't have these hlgroups changed
  NvimTreeOpenedFolderName = { fg = "nord_blue", },
  NvimTreeOpenedFile = { fg = "nord_blue", bold = true },
  NvimTreeExecFile = { fg = "green" },

  --------Custom Statusline coloring-----------------
  StInviSep = { fg = "statusline_bg", bg = "statusline_bg" },
  StSessionStatus = { fg = "blue", bg = "statusline_bg" },

  --CurFile
  StCwd        = { bg = "yellow", fg = "black" },
  StFile       = { bg = "orange", fg = "black", bold = true },
  StCwdSep     = { fg = "yellow", bg = "statusline_bg" },
  StFileSep    = { fg = "orange", bg = "statusline_bg" },
  StDirFileSep = { fg = "yellow", bg = "orange" },

  -- Git stuffs
  StGitBranch  = { fg = "purple", bg = "statusline_bg" },
  StGitAdded   = { fg = "green", bg = "statusline_bg" },
  StGitChanged = { fg = "yellow", bg = "statusline_bg" },
  StGitRemoved = { fg = "red", bg = "statusline_bg" },

  -- LSP Stuffs
  -- StLSPProgress = { bg = "statusline_bg", fg = "" },
  StLSPClient   = { bg = "statusline_bg", fg = "blue", bold = true },
  StLSPErrors   = { bg = "statusline_bg", fg = "red" },
  StLSPWarnings = { bg = "statusline_bg", fg = "yellow" },
  StLSPHints    = { bg = "statusline_bg", fg = "purple" },
  StLspInfo     = { bg = "statusline_bg", fg = "cyan" },

  -- File Info stuffs
  StPosition    = { bg = "teal", fg = "black" },
  StPositionSep = { bg = "statusline_bg", fg = "teal" },
  --------Custom Statusline coloring ends------------

  --------Custom Tabline coloring--------------------
  TabLineFill       = { bg = "black2" },
  TabLineBufHidden  = { fg = "light_grey", bg = "black2" },
  TabLineBufActive  = { fg = "cyan", bg = "black2", },
  TabLineCurrentBuf = { fg = "pink", bg = "darker_black", bold = true },
  TabLineModified   = { fg = "green" },
  TabLineCurrentTab = { fg = "darker_black", bg = "red", bold = true },
  TabLineOtherTab   = { fg = "white", bg = "black2" },
  --------Custom Tabline coloring ends---------------

  --------Nvim Notify--------------------------------
  -- NotifyERRORBorder = { fg = "red" },
  -- NotifyWARNBorder  = { fg = "yellow" },
  -- NotifyINFOBorder  = { fg = "nord_blue" },
  -- NotifyDEBUGBorder = { fg = "grey" },
  -- NotifyTRACEBorder = { fg = "grey" },
  -- NotifyERRORIcon   = { fg = "red" },
  -- NotifyWARNIcon    = { fg = "yellow" },
  -- NotifyINFOIcon    = { fg = "nord_blue" },
  -- NotifyDEBUGIcon   = { fg = "grey" },
  -- NotifyTRACEIcon   = { fg = "grey" },
  -- NotifyERRORTitle  = { fg = "red" },
  -- NotifyWARNTitle   = { fg = "yellow" },
  -- NotifyINFOTitle   = { fg = "nord_blue" },
  -- NotifyDEBUGTitle  = { fg = "grey" },
  -- NotifyTRACETitle  = { fg = "grey" },
  --------Nvim Notify ends--------------------------0
}

return M
