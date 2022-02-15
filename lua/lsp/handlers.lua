local M = {}

M.on_attach = function(client, bufnr)
  -- notify(client.name)
  if client.name == "tsserver" or client.name == "html" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end
