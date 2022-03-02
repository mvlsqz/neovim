require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'},
}

require('orgmode').setup({
  org_agenda_files = {'~/Documents/agenda'},
  org_default_notes_file = '~/Documents/agenda/refile.org',
  mappings = {
    global = {
      org_agenda = 'gA',
      org_capture = 'gC',
      org_refile = 'gOr'
    }
  }
})
