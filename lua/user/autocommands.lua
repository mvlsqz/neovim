-- vim.cmd('colorscheme ayu-dark')
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

vim.cmd[[
  augroup jenkinsfile
    autocmd!
    autocmd FileType Jenkinsfile set filetype=jenkinsfile
  augroup END
]]

vim.cmd[[
  autocmd FileType java.jenkinsfile lua require'cmp'.setup.buffer {
  \   sources = {
  \     { name = 'jenkinsfile',
  \       option = {
  \         jenkins_url = 'http://jenkins:8080/'
  \       }
  \     },
  \   { name = 'buffer' },
  \   { name = 'luasnip' }
  \   },
  \ }
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
