local null_ls = require "null-ls"
local frozen_string_actions = {
  method = null_ls.methods.CODE_ACTION,
  filetypes = { "ruby" },
  generator = {
    fn = function(context)
      local frozen_string_literal_comment = "# frozen_string_literal: true"

      local first_line = context.content[1]

      if first_line ~= frozen_string_literal_comment then
        return {
          {
            title = "🥶Add frozen string literal comment",
            action = function()
              local lines = {
                frozen_string_literal_comment,
                "",
                first_line,
              }

              vim.api.nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
            end,
          },
        }
      end
    end,
  },
}

null_ls.register(frozen_string_actions)
