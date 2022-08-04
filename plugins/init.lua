return {
  ["kdheepak/lazygit.nvim"] = {
    after = "telescope.nvim",
    setup = function ()
      require("core.lazy_load").on_file_open("lazygit.nvim")
    end,
    config = function ()
      require "custom.plugins.lazygit"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function ()
      require "custom.plugins.null-ls"
    end
  },
  ["neovim/nvim-lspconfig"] = {
    setup = function ()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
    end,
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.plugins.lspconfig")
    end
  },
  ['rodjek/vim-puppet'] = {
    opt = true,
    ft = "puppet"
  },
  ['goolord/alpha-nvim'] = {
    disable = false,
    command = "Alpha"
  },
  ['nvim-neorg/neorg'] = {
    after = "nvim-treesitter",
    setup = function ()
      require("core.lazy_load").on_file_open("neorg")
      require("core.lazy_load").on_file_open("plenary.nvim")
      require("core.lazy_load").on_file_open("nvim-treesitter")
    end,
    ft = "norg",
    config = function()
      require "custom.plugins.neorgconfig"
    end,
    requires = "nvim-lua/plenary.nvim",
  },
}
