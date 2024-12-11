return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  dependencies = { "folke/zen-mode.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icons = {
              code_block = {
                conceal = true,
                padding = {
                  left = 4,
                  right = 4,
                },
              },
            },
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              personal = "~/Documents/Notes/Personal",
              projects = "~/Documents/Notes/Projects",
              documentation = "~/Documents/Notes/Documentation",
            },
            index = "index.norg",
            default_workspace = "personal",
          },
        },
        ["core.summary"] = {},
        ["core.ui.calendar"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.queries.native"] = {},
      },
    })
  end,
}
