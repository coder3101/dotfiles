return function(client, bufnr)
  require('notify')("Attached langauge server")
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Mappings.
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>gR', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>n',  vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>N',  vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>af', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover, bufopts)


  --vim.keymap.set('n', '<leader>q', vim.lsp.diagnostic.set_loclist)
  --vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics)
  --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
  --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)

  -- Set some keybinds conditional on server capabilities
  local function format_code()
    vim.lsp.buf.format()
    require('notify')("Formatting completed")
  end
  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>=", format_code, bufopts)
  end
end
