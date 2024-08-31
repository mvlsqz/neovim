return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "ansible-lint",
      "flake8",
      "npm-groovy-lint",
    },
  },
}
