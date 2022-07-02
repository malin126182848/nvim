local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

   b.formatting.deno_fmt,
   b.formatting.prettierd.with { filetypes = { "c", "cpp", "html", "markdown", "css" } },

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- cpp
   b.formatting.clang_format.with { extra_args = { "-style={BaseOnStyle: Google}" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
}

