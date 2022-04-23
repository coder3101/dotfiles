return function(client, bufnr)
  print('Language Server attached')

  -- Mappings.
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename)
  vim.keymap.set('n', '<leader>gR', vim.lsp.buf.references)
  vim.keymap.set('n', '<leader>n',  vim.lsp.diagnostic.goto_prev)
  vim.keymap.set('n', '<leader>N',  vim.lsp.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>af', vim.lsp.buf.code_action)
  vim.keymap.set('n', 'K',          vim.lsp.buf.hover)


  --vim.keymap.set('n', '<leader>q', vim.lsp.diagnostic.set_loclist)
  --vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics)
  --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
  --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    vim.keymap.set("n", "<leader>=", vim.lsp.buf.formatting)
  elseif client.resolved_capabilities.document_range_formatting then
    vim.keymap.set("v", "<leader>=", vim.lsp.buf.range_formatting)
  end
end
