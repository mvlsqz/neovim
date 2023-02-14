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
