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
    "flake8",
    "gopls",
    "jedi-language-server",
    "lua-language-server",
    "luacheck",
    "pylint",
    "stylua",
    "terraform-ls",
    "tflint",
    -- "haskell-language-server",
  },
}

return M
