local home = os.getenv("HOME")
return {
  {
    "serenevoid/kiwi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      {
        name = "notes",
        path = home .. "/Documents/notes",
      },
    },
    keys = function()
      local kiwi = require("kiwi")
      return {
        {
          "<leader>vw",
          function()
            kiwi.open_wiki_index()
          end,
          desc = "View wiki notes",
        },
        {
          "<leader>vt",
          function()
            kiwi.todo.toggle()
          end,
          desc = "Toggle todo",
        },
      }
    end,
  },
}
