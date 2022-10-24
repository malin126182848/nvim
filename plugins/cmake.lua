local ok, cmakeTools = pcall(require, "cmake-tools")

if not ok then
  return print "Error loading cmake tools"
end

cmakeTools.setup {
  cmake_command = "cmake",
  cmake_build_directory = "build",
  cmake_build_type = "Debug",
  cmake_generate_options = { "-G", "Ninja", "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = {},
  cmake_console_size = 4, -- cmake output window height
  cmake_show_console = "only_on_error", -- "always", "only_on_error"
  cmake_dap_configuration = { name = "cpp", type = "codelldb", request = "launch" }, -- dap configuration, optional
  cmake_dap_open_command = require("dap").repl.open, -- optional
}
