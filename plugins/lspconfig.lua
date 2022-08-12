vim.lsp.set_log_level "debug"
local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = {
  "jedi_language_server",
  "terraformls",
  "gopls",
  -- "haskell-language-server",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
