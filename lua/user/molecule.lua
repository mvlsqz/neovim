local actions_state = require'telescope.actions.state'
local pickers = require'telescope.pickers'
local finders = require'telescope.finders'
local dropdown = require'telescope.themes'.get_dropdown()
local Terminal = require('toggleterm.terminal').Terminal

local function enter(prompt_bufnr)
  local selected = actions_state.get_selected_entry()
  local molecule = Terminal:new({ cmd = selected[1], hidden = true, close_on_exit = false })
  molecule:toggle()
end


local opts = {
  finder = finders.new_table {
    'conda env list'
  },

  attach_mappings = function(prompt_bufnr, map)
    map('i', '<CR>', enter)
    return true
  end,
}

Puppshell = pickers.new(dropdown, opts)
Puppshell:find()
