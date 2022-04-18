local M = {}
local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

-- Auto-install

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local ok, eslint = lsp_installer_servers.get_server("eslint")
if ok then
    if not eslint:is_installed() then
        eslint:install()
    end
end

-- Settings

M.settings = {
  format = { enable = true };
  languages = {
    javascript = { eslint_d };
    typescript = { eslint_d },
  }
}

return M
