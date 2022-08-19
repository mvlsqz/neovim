local M = {}

M.nvimtree = {
  view = {
    side = "left",
    width = 30,
  },
}

M.treesitter = {
  ensure_installed = {
    "lua",
    "python",
    "hcl",
    "yaml",
    -- "norg",
    "bash",
    "markdown",
    "ruby",
  },
  highlight = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "ansible-language-server",
    "lua-language-server",
    "stylua",
    "luacheck",
    "jedi-language-server",
    "terraform-ls",
    "pylint",
    "flake8",
    "gopls",
    "tflint",
    -- "haskell-language-server",
  },
}

return M
