vim.lsp.set_log_level "debug"
local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = {
  "jedi_language_server",
  "terraform_lsp",
  "terraformls",
  "gopls",
  -- "haskell-language-server",
}

for _, server in ipairs(servers) do
  if server == "terraform_lsp" or server == "terraformls" then
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  else
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
