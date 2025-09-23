local user_home = vim.fn.expand("~")
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {},
      terraformls = {},
      gopls = {},
      ruff = {},
    },
  },
}
