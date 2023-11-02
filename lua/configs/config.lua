C = {}

C.oil = function()
  require("oil").setup()
end

C.theme = function()
  require("tokyonight").setup({
    style = "moon",
    transparent = true,
  })
end

C.treesitter = function()
  local opts = require("configs").options.treesitter

  if type(opts.ensure_installed) == "table" then
    ---@type table<string, boolean>
    local added = {}
    opts.ensure_installed = vim.tbl_filter(function(lang)
      if added[lang] then
        return false
      end
      added[lang] = true
      return true
    end, opts.ensure_installed)
  end
  require("nvim-treesitter.configs").setup(opts)
end

C.tstextobjects = function()
  -- When in diff mode, we want to use the default
  -- vim text objects c & C instead of the treesitter ones.
  local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
  local configs = require("nvim-treesitter.configs")
  for name, fn in pairs(move) do
    if name:find("goto") == 1 then
      move[name] = function(q, ...)
        if vim.wo.diff then
          local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
          for key, query in pairs(config or {}) do
            if q == query and key:find("[%]%[][cC]") then
              vim.cmd("normal! " .. key)
              return
            end
          end
        end
        return fn(q, ...)
      end
    end
  end
end

C.betterscape = function()
  require("better_escape").setup({
    mapping = { "jk", "jj", "JJ", "JK" },
  })
end

C.marks = function()
  local marks = require("marks")
  marks.setup({})
end

C.mind = function()
  require("mind").setup({
    persistence = {
      state_path = "~/Documents/notes/mind.json",
      data_dir = "~/Documents/notes/",
    },
    edit = {
      data_extension = ".norg",
      data_header = "* %s",
      copy_link_format = "{:%s:}[]",
    },
    tree = {
      automatic_creation = true,
    },
    ui = {
      width = 30,
      root_marker = "󱗼 ",
      data_marker = "󱘫 ",
      url_marker = "󰖟 ",
      icon_preset = {
        { " ", "Sub-project" },
        { " ", "Journal, newspaper, weekly and daily news" },
        { "󱩎 ", "For when you have an idea" },
        { " ", "Note taking?" },
        { " ", "Task management" },
        { " ", "Done" },
        { "󰦖 ", "In Progress" },
        { "󱙔 ", "Investigation" },
        { " ", "Uncheck, empty square or backlog" },
        { " ", "Full square or on-going" },
        { " ", "Check or done" },
        { " ", "Trash bin, deleted, cancelled, etc." },
        { " ", "GitHub" },
        { "󱑞 ", "Monitoring" },
        { "󰛍 ", "Internet, Earth, everyone!" },
        { " ", "Frozen, on-hold" },
      },
    },
  })
end

return C
