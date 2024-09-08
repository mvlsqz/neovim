-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opts_info = vim.api.nvim_get_all_options_info()

local opt = setmetatable({}, {
  __newindex = function(_, key, value)
    vim.o[key] = value
    local scope = opts_info[key].scope
    if scope == "win" then
      vim.wo[key] = value
    elseif scope == "buf" then
      vim.bo[key] = value
    end
  end,
})

opt.formatoptions = table.concat({
  "1",
  "q", -- continue comments with gq"
  "c", -- Auto-wrap comments using textwidth
  "r", -- Continue comments when pressing Enter
  "n", -- Recognize numbered lists
  "2", -- Use indent from 2nd line of a paragraph
  "t", -- autowrap lines using text width value
  "j", -- remove a comment leader when joining lines.
  -- Only break if the line was not longer than 'textwidth' when the insert
  -- started and only at a white character that has been entered during the
  -- current insert command.
  "lv",
})

opt.foldmethod = "syntax"
vim.g.vimsyn_embed = "lPr" -- allow embedded syntax highlighting for lua,python and ruby
opt.wrap = true
opt.wrapmargin = 2
opt.softtabstop = 2
opt.textwidth = 80
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
vim.o.shiftround = true
