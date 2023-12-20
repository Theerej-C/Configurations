require("mason").setup()
require("mason-lspconfig").setup{
ensure_installed = { "lua_ls", "rust_analyzer","jedi_language_server","clangd" },
}



local on_attach = function(_,_)
 vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,{})

 vim.keymap.set('n','gd',vim.lsp.buf.definition,{})


 vim.keymap.set('n','gi',vim.lsp.buf.implementation,{})


 vim.keymap.set('n','K',vim.lsp.buf.hover,{})

end

-- cmp 

 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })


local capabilities = require('cmp_nvim_lsp').default_capabilities()



require'lspconfig'.jdtls.setup{}
-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup {
 on_attach = on_attach,
 capabilities = capabilities

}
require("lspconfig").clangd.setup {
 on_attach = on_attach,
 capabilities = capabilities

}
require("lspconfig").jedi_language_server.setup {
 on_attach = on_attach,
 capabilities = capabilities,
 root_dir = function(fname)    
        return vim.loop.cwd()
    end,
}
require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach
}
-- ...
