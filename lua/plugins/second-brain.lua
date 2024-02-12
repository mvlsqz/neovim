return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "lukas-reineke/headlines.nvim",
      config = true, -- or `opts = {}`
    },
  },
  opts = {
    workspaces = {
      {
        name = "knowledge",
        path = "~/Projects/Obsidian/knowledge",
      },
      {
        name = "notes",
        path = "~/Projects/Obsidian/notes",
      },
    },
  },
}
