return {
  {
    "neovim/nvim-lspconfig",
    version = "^1.0.0",
    opts = {
      servers = {
        jinja_lsp = {},
        yamlls = {
          settings = {
            yaml = {
              customTags = {
                "!ruby/sym scalar",
              },
            },
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "ruff",
      },
    },
  },
}
