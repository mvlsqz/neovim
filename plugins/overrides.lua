local M = {}

M.nvimtree = {
  view = {
    side = "left",
    width = 30,
  },
}

M.treesitter = {
  ensure_installed = {
    "help",
    "lua",
    "python",
    "hcl",
    "yaml",
    "norg",
    "bash",
    "markdown",
    "ruby",
    "latex",
  },
  highlight = {
    enable = true,
  },
}

M.chadui = {
  statusline = {
    separator_style = "default",
  },
}

M.mason = {
  ensure_installed = {
    "ansible-language-server",
    "flake8",
    "gopls",
    "pyright",
    "lua-language-server",
    "luacheck",
    "pylint",
    "stylua",
    "terraform-ls",
    "tflint",
    "texlab",
  },
}

return M
