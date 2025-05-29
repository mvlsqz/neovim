return {
  "stevearc/conform.nvim",
  -- optional = true,
  opts = {
    formatters_by_ft = {
      ["groovy"] = { "npm-groovy-lint" },
      ["yaml.ansible"] = { "ansible-lint" },
    },
  },
}
