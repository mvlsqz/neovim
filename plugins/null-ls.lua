local ok, null_ls = pcall(require, "null-ls")
local ruby_code_actions = require "custom.plugins.codeactions.ruby"

if ok then
  local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
      bufnr,
      "textDocument/formatting",
      vim.lsp.util.make_formatting_params {},
      function(err, res, ctx)
        if err then
          local err_msg = type(err) == "string" and err or err.message
          -- you can modify the log message / level (or ignore it completely)
          vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
          return
        end

        -- don't apply results if buffer is unloaded or has been modified
        if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
          return
        end

        if res then
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
          vim.api.nvim_buf_call(bufnr, function()
            vim.cmd "silent noautocmd update"
          end)
        end
      end
    )
  end

  local builtins = null_ls.builtins

  local sources = {
    -- Formatters
    builtins.formatting.stylua,
    builtins.formatting.terraform_fmt,
    builtins.formatting.puppet_lint,
    builtins.diagnostics.rubocop.with {
      args = {
        "-f",
        "json",
        "--stdin",
        "$FILENAME",
      },
    },
    builtins.diagnostics.zsh,
    builtins.diagnostics.luacheck.with {
      args = {
        "--allow-defined",
      },
    },
    builtins.diagnostics.flake8,
    builtins.diagnostics.pylint,
    builtins.diagnostics.puppet_lint,
    -- Code actions
    builtins.code_actions.refactoring,
    builtins.hover.dictionary,
    ruby_code_actions.autocorrect_with_rubocop,
    ruby_code_actions.insert_frozen_string_literal,
  }

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            async_formatting(bufnr)
            -- vim.lsp.buf.formatting {
            --   bufnr = bufnr,
            --   filter = function()
            --     return client.name == "null-ls"
            --   end,
            -- }
          end,
        })
      end
    end,
  }
end
