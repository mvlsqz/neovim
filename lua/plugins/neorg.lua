return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
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
        ["core.export"] = {},
        ["core.export.markdown"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
      },
    })
  end,
}
