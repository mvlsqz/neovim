return {
  {
    "neovim/nvim-lspconfig",
    version = "^1.0.0",
    opts = {
      servers = {
        ansiblels = {},
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
    "mason-org/mason.nvim",
    -- version = "^1.0.0",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "ruff",
        "ansible-lint",
      },
    },
  },
  {
    "mfussenegger/nvim-ansible",
    ft = {},
    keys = {
      {
        "<leader>ta",
        function()
          require("ansible").run()
        end,
        desc = "Ansible Run Playbook/Role",
        silent = true,
      },
    },
  },
}
