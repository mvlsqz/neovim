return {
  "phaazon/mind.nvim",
  branch = "v2.2",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("mind").setup({
      edit = {
        data_extension = ".norg",
        data_header = "* %s",
      },
    })
  end,
  dependencies = {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.norg.concealer"] = {},
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      })
    end,
  },
}
