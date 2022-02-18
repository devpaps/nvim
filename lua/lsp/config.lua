local lsp_installer = require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)


   local capabilities = vim.lsp.protocol.make_client_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if status_ok then
      capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    end

    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
    }

    if server.name == "sumneko_lua" then
      opts.settings = require('lsp.servers.lua').settings
    end

      server:setup(opts)
end)

-- Include the servers you want to have installed by default below
local servers = {
  "tsserver",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end
