return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
      override = {
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
}
