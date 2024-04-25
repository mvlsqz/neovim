return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local theme_colors = require("tokyonight.colors").setup()
    local lualine = require("lualine")

    -- Color table for highlights
    local colors = {
      bg = theme_colors.bg,
      fg = theme_colors.fg,
      yellow = theme_colors.yellow,
      cyan = theme_colors.cyan,
      darkblue = theme_colors.teal,
      green = theme_colors.green,
      orange = theme_colors.orange,
      violet = theme_colors.purple,
      magenta = theme_colors.magenta,
      blue = theme_colors.blue,
      red = theme_colors.red,
      teal = theme_colors.teal,
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg_dark } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      function()
        return ""
      end,
      color = { fg = theme_colors.bg, bg = theme_colors.none },
      padding = { left = 0, right = 0 }, -- We don't need space before this
    })
    local mode_color = {
      n = { mode_id = "", color = colors.teal },
      i = { mode_id = "", color = colors.red },
      v = { mode_id = "", color = colors.blue },
      [""] = { mode_id = "^", color = colors.blue },
      V = { mode_id = "", color = colors.blue },
      c = { mode_id = " ", color = colors.magenta },
      no = { mode_id = "no", color = colors.red },
      s = { mode_id = "s", color = colors.orange },
      S = { mode_id = "S", color = colors.orange },
      [""] = { mode_id = '[""]', color = colors.orange },
      ic = { mode_id = "ic", color = colors.yellow },
      R = { mode_id = "⌦", color = colors.violet },
      Rv = { mode_id = "Rv", color = colors.violet },
      cv = { mode_id = "cv", color = colors.red },
      ce = { mode_id = "ce", color = colors.red },
      r = { mode_id = "r", color = colors.cyan },
      rm = { mode_id = "rm", color = colors.cyan },
      ["r?"] = { mode_id = '["r?"]', color = colors.cyan },
      ["!"] = { mode_id = '["!"]', color = colors.red },
      t = { mode_id = "t", color = colors.red },
    }
    ins_left({
      -- mode component
      -- "filetype",
      function()
        return mode_color[vim.fn.mode()].mode_id
      end,
      color = function()
        -- auto change color according to neovims mode

        return { fg = mode_color[vim.fn.mode()].color, gui = "bold" }
      end,
      padding = { right = 0 },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.magenta, gui = "bold" },
    })

    ins_left({
      function()
        local recording_register = vim.fn.reg_recording()

        if recording_register == "" then
          return ""
        else
          return "󰔧 " .. recording_register
        end
      end,
      color = { fg = colors.red, gui = "bold" },
    })

    ins_left({ "location" })

    ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      -- Lsp server name .
      function()
        local msg = "No Active Lsp"
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        local lsp_clients = {}
        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          table.insert(lsp_clients, client.name)
        end
        msg = table.concat(lsp_clients, " 󰇝 ")
        return msg
      end,
      -- icon = " ",
      color = { fg = colors.yellow, gui = "bold" },
    })

    -- Add components to right sections
    ins_right({
      "o:encoding", -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = colors.green, gui = "bold" },
    })

    ins_right({
      "branch",
      icon = "",
      color = { fg = colors.violet, gui = "bold" },
    })
    local git_symbols = require("lazyvim.config").icons.git
    ins_right({
      "diff",
      symbols = { added = git_symbols.added, modified = git_symbols.modified, removed = git_symbols.removed },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_right({
      function()
        return ""
      end,
      color = { fg = theme_colors.bg, bg = theme_colors.none },
      padding = { left = 0 },
    })

    lualine.setup(config)
  end,
}
