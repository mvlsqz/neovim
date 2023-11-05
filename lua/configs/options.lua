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

O.toggleterm = {
  open_mapping = [[<leader>h]],
  direction = "horizontal",
  shade_filetypes = {},
  hide_numbers = true,
  insert_mappings = true,
  terminal_mappings = true,
  start_in_insert = true,
  close_on_exit = true,
}

return O
