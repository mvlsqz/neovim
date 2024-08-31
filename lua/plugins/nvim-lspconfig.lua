return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
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
