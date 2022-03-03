require('neorg').setup{
  load = {
    ["core.norg.concealer"] = {},
    ["core.defaults"] = {},
    ['core.integrations.telescope'] = {},
    ['core.norg.journal'] = {
      config = {
        workspace = 'work',
        journal_folder = 'notes',
      }
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      }
    },
    ['core.gtd.ui'] = {},
    ['external.gtd-project-tags'] = {},
    ['core.gtd.base'] = {
      config = {
        workspace = 'work',
        inbox = 'inbox.norg'
      }
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          work = "~/Documents/work",
          home = "~/Documents/home"
        },
        autochdir = true,
        index = 'index.norg',
        last_workspace = vim.fn.stdpath("cache") .. "/neorg_last_workspace.txt"
      }
    }
  }
}
