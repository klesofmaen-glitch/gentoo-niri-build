local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})
lspconfig.clangd.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }
    }
  }
})
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = fqunction(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = { { name = "nvim_lsp" } }
})
