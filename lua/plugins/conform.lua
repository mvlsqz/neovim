return {
  "stevearc/conform.nvim",
  opts = {
    notify_on_error = true,
    default_format_opts = {
      timeout_ms = 20000,
    },
    formatters_by_ft = {
      ["groovy"] = { "npm-groovy-lint" },
      ["yaml.ansible"] = { "ansible-lint" },
    },
  },
}
