return {
  "stevearc/conform.nvim",
  -- optional = true,
  opts = {
    formatters_by_ft = {
      ["groovy"] = { "npm-groovy-lint" },
      ["yaml.ansible"] = { "ansiblelint" },
    },
    formatters = {
      ansiblelint = {
        command = "ansible-lint",
        stdin = false,
        args = { "--fix", "$FILENAME" },
      },
    },
  },
  -- config = function()
  --   require("conform").setup({

  --   })
  -- end,
}
