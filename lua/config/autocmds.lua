-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api
local autocmd = api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "terraform",
  callback = function()
    local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
    ft_to_parser.terraform = "hcl"
  end,
})
autocmd("FileType", {
  pattern = "tfvars",
  callback = function()
    local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
    ft_to_parser.terraform = "hcl"
  end,
})

autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  callback = function()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  end,
})

autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.cole = 1
    vim.opt_local.foldlevel = 10
    vim.opt_local.foldenable = false
    vim.opt_local.signcolumn = "yes:2"
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})
