O = {}

O.theme = {}
O.lazyvim = {
  colorscheme = function()
    require("tokyonight").load()
  end,
}
O.lsp = {
  servers = {
    dockerls = {},
    bashls = {},
    yamlls = {},
    ansiblels = {},
    terraformls = {},
    gopls = {},
    ruff_lsp = {},
    pyright = {
      single_file_support = true,
      settings = {
        pyright = {
          disableLanguageServices = false,
          disableOrganizeImports = false,
        },
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace", -- openFilesOnly, workspace
            typeCheckingMode = "basic", -- off, basic, strict
            useLibraryCodeForTypes = true,
          },
        },
      },
    },
  },
}

O.conform = {
  formatters_by_ft = {
    terraform = "terraform",
  },
  formatters = {
    terraform = {
      args = { "fmt" },
    },
  },
}

O.treesitter = {
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
    "bash",
    "diff",
    "go",
    "hcl",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "terraform",
    "yaml",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  textobjects = {
    move = {
      enable = true,
      goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
      goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
      goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
      goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
    },
  },
}

return O
