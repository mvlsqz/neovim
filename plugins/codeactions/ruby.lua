local overridables = {}

overridables.tempname = function()
  return vim.api.nvim_call_function("tempname", {})
end

overridables.writefile = function(lines, filename)
  return vim.api.nvim_call_function("writefile", { lines, filename })
end

overridables.readfile = function(filename)
  return vim.api.nvim_call_function("readfile", { filename })
end

overridables.system = function(cmd)
  return vim.api.nvim_call_function("system", { cmd })
end

overridables.reindent = function(start_line, end_line)
  vim.api.nvim_command('execute "normal!' .. start_line .. "G=" .. end_line .. 'G"')
end

local strings = {
  safe_autocorrect_with_rubocop = "Rubocop Autocorrect",
  frozen_string_literal = "Add frozen string literal",
  frozen_string_literal_comment = "# frozen_string_literal: true",
}

local helpers = {}

helpers.single_line = function(context)
  return context.range.row == context.range.end_row
end

helpers.visual_selection = function(context)
  return (context.range.row ~= context.range.end_row) or (context.range.col ~= context.range.end_col)
end

helpers.selected_lines = function(context)
  local lines = {}
  for i = context.range.row, context.range.end_row do
    table.insert(lines, context.content[i])
  end
  return lines
end

helpers.process_selected_lines_as_tempname = function(command, context)
  local tempname = overridables.tempname()
  overridables.writefile(helpers.selected_lines(context))
  overridables.system(command:gsub("__FILE__", tempname))
  return overridables.readfile(tempname)
end

local insert_frozen_string_literal_generator = function(context)
  local first_line = context.content[1]

  if first_line ~= strings.frozen_string_literal_comment then
    return {
      {
        title = strings.frozen_string_literal,
        action = function()
          local lines = {
            strings.frozen_string_literal_comment,
            "",
            first_line,
          }

          vim.api.nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
        end,
      },
    }
  end
end

local autocorrect_with_rubocop_generator = function(context)
  local actions = {}

  if not helpers.visual_selection(context) then
    local autocorrect_file = function(flags, ctx)
      overridables.system("rubocop " .. flags .. " " .. ctx.bufname)
      vim.api.nvim_command "edit"
    end

    table.insert(actions, {
      title = strings.safe_autocorrect_with_rubocop,
      action = function()
        autocorrect_file("-a -f quiet -o /dev/null", context)
      end,
    })
  end

  return actions
end

local null_ls = require "null-ls"
local make_code_action = function(fun)
  return {
    method = null_ls.methods.CODE_ACTION,
    filetypes = { "ruby" },
    generator = { fn = fun },
  }
end

return {
  generators = {
    autocorrect_with_rubocop_generator = autocorrect_with_rubocop_generator,
    insert_frozen_string_literal_generator = insert_frozen_string_literal_generator,
  },
  overridables = overridables,
  strings = strings,
  autocorrect_with_rubocop = make_code_action(autocorrect_with_rubocop_generator),
  insert_frozen_string_literal = make_code_action(insert_frozen_string_literal_generator),
}
