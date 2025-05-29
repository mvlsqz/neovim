local user_home = vim.fn.expand("~")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      terraformls = {},
      gopls = {},
      ruff = {},
      -- groovyls = {
      --   settings = {
      --     groovy = {
      --       classpath = {
      --         user_home .. "/.gradle/caches/modules-2/files-2.1",
      --       },
      --     },
      --   },
      -- },
    },
  },
}
