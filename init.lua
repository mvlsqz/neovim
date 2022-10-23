local o = vim.opt
o.backup = false -- creates a backup file
o.shell = "fish"
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.hlsearch = true -- highlight all matches on previous search pattern
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program)it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- the number of spaces inserted for each indentation
o.tabstop = 2 -- insert 2 spaces for a tab
o.cursorline = true -- highlight the current line
o.number = true -- set numbered lines
o.numberwidth = 4 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign columnotherwise it would shift the text each time
o.wrap = true -- display lines as one long line
o.scrolloff = 8 -- is one of my fav
o.sidescrolloff = 8
o.foldmethod = "expr"
o.relativenumber = true -- set relative numbered lines

local api = vim.api
local autocmd = api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.cole = 1
    vim.opt_local.foldlevel = 10
    vim.opt_local.foldenable = false
    vim.opt_local.signcolumn = "yes:2"
  end,
})

autocmd("BufEnter", {
  callback = require("lazygit").utils.project_root_dir,
})
