return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = true, -- or `opts = {}`
    },
  },
  opts = {
    workspaces = {
      {
        name = "knowledge",
        path = vim.fn.expand("~/Documents/obsidian/knowledge"),
      },
      {
        name = "work",
        path = vim.fn.expand("~/Documents/obsidian/work"),
      },
    },

    notes_subdir = "00 - Fleeting",

    daily_notes = {
      folder = "05 - Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = "daily_template.md",
    },

    templates = {
      folder = "04 - Templates",
      note_template = "concept_template.md",
      daily_note_template = "daily_template.md",
    },

    completion = {
      min_chars = 2,
    },

    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },

    new_notes_location = "notes_subdir",

    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,

    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_id_prefix(opts)
    end,

    markdown_link_func = function(opts)
      return require("obsidian.util").markdown_link(opts)
    end,

    preferred_link_style = "markdown",

    ---@return string
    image_name_func = function()
      return string.format("%s-", os.time())
    end,

    disable_frontmatter = false,

    ---@return table
    note_frontmatter_func = function(note)
      if note.title then
        note:add_alias(note.title)
      end

      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url }) -- Mac OS
    end,

    use_advanced_uri = false,

    open_app_foreground = false,

    picker = {
      name = "fzf-lua",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },
    sort_by = "modified",
    sort_reversed = true,

    open_notes_in = "vsplit",

    ui = {
      enable = false,
    },

    attachments = {
      img_folder = "assets/imgs", -- This is the default
      ---@param client obsidian.Client
      ---@param path obsidian.Path the absolute path to the image file
      ---@return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}
