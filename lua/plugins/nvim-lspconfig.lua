return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
      ansiblels = {
        -- cmd = { "/opt/homebrew/bin/ansible-language-server", "--stdio" },
      },
      terraformls = {},
      groovyls = {
        settings = {
          groovy = {
            classpath = {
              "/Users/io/Public/Libs/java/",
            },
          },
        },
      },
      gopls = {},
    },
  },
}
