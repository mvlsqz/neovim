vim.lsp.set_log_level "debug"
local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local default_capabilities = require("plugins.configs.lspconfig").capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities(default_capabilities)

local servers = {
  "pyright",
  "terraformls",
  "gopls",
  "ansiblels",
  "texlab",
  "hls",
}

for _, server in ipairs(servers) do
  if server == "texlab" then
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "tex", "bib" },
      settings = {
        texlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            executable = "latexmk",
            forwardSearchAfter = true,
            onSave = true,
          },
          chktex = {
            onEdit = false,
            onOpenAndSave = false,
          },
          diagnosticsDelay = 300,
          formatterLineLength = 80,
          forwardSearch = {
            executable = "zathura",
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
          latexFormatter = "latexindent",
          latexindent = {
            modifyLineBreaks = false,
          },
        },
      },
    }
  else
    lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
