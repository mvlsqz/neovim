return function ()
  local ok, lspconfig = pcall(require, "lspconfig")
  local configs_ok, configs = pcall(require, "plugins.configs.lspconfig")

  if not ok then
    return
  end

  if not configs_ok then
   return
  end

  local servers ={
    "jedi_language_server",
    "terraformls",
    "gopls",
    -- "haskell-language-server",
  }
  local on_attach = configs.on_attach
  local capabilities = configs.capabilities

  for _, server in ipairs(servers) do
   lspconfig[server].setup {
     on_attach = on_attach,
     capabilities = capabilities,
   }
  end
end
