local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  -- this is where you enable features that only work
  -- if there is a language server active in the file
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local luasnip = require('luasnip')
local opts = { buffer = bufnr, noremap = true, silent = true }
cmp.setup({
  sources = {
      {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.complete(),
      ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
      -- Mappings.
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts),
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts),
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts),
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts),
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts),
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts),
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts),
      vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts),
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts),
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts),
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts),
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts),
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts),
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts),
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts),
  }),
  snippet = {
      expand = function(args)
          luasnip.lsp_expand(args.body)
      end
  },
})

require('mason').setup({})
lsp = require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'clangd', "bashls", "tsserver", "eslint"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
