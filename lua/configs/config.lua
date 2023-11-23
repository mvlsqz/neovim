local home = os.getenv("HOME")
C = {}

C.oil = function()
  require("oil").setup()
end

C.theme = function()
  require("tokyonight").setup({
    style = "night",
    transparent = true,
    styles = {
      functions = { bold = true },
      methods = { bold = true },
    },
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
    end,
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

C.neorg = function()
  require("neorg").setup({
    load = {
      ["core.defaults"] = {},
      ["core.summary"] = {},
      ["core.autocommands"] = {},
      ["core.presenter"] = {
        config = {
          zen_mode = "zen-mode",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.esupports.indent"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "basic",
          icons = {
            code_block = {
              conceal = true,
              content_only = true,
              padding = {
                left = 5,
                right = 5,
              },
              width = "fullwidth",
            },
          },
        },
      },
      ["core.qol.toc"] = {
        config = {
          close_after_use = true,
        },
      },
      ["core.looking-glass"] = {},
      ["core.export"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            main = home .. "/Documents/notes",
            knowledge = home .. "/Documents/notes/knowledge",
            notes = home .. "/Documents/notes/my-notes",
          },
          default_workspace = "main",
        },
      },
    },
  })

  vim.wo.foldlevel = 10
  vim.wo.number = false
  vim.wo.cole = 1
  vim.wo.foldenable = true
  vim.wo.signcolumn = "yes:2"
  vim.wo.relativenumber = true
  vim.wo.number = false
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.wo.conceallevel = 3
  vim.g.maplocalleader = ","
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return C
