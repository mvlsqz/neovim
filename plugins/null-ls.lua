local ok, null_ls = pcall(require, 'null-ls')

if ok then
  local builtins = null_ls.builtins

  local sources = {
    -- Formatters
    builtins.formatting.stylua,
    builtins.formatting.terraform_fmt,
    -- Linters
    builtins.diagnostics.zsh,
    builtins.diagnostics.luacheck.with({
      args = {
        "--allow-defined"
      }
    }),
    builtins.diagnostics.flake8,
    builtins.diagnostics.pylint,
    -- Code actions
    builtins.code_actions.refactoring,
    builtins.hover.dictionary,
  }

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function (client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function ()
            vim.lsp.buf.formatting {
              bufnr = bufnr,
              filter = function ()
                return client.name == "null-ls"
              end
            }
          end
        })
      end
    end
  }
end
