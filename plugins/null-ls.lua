local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettier,

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with({
      diagnostics_format = "#{m} [#{c}]",
   }),

   -- cpp
   b.formatting.clang_format.with({
      extra_args = { "-style={BasedOnStyle: Microsoft, AccessModifierOffset: -4, AllowAllConstructorInitializersOnNextLine: false, AllowAllParametersOfDeclarationOnNextLine: false, BreakConstructorInitializersBeforeComma: true, BinPackParameters: false, BreakConstructorInitializers: BeforeComma, ConstructorInitializerAllOnOneLineOrOnePerLine: false, DerivePointerAlignment: true, NamespaceIndentation: All}" },
   }),
}

null_ls.setup {
   debug = true,
   sources = sources,
}

