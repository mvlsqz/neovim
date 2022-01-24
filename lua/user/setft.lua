local au = require('au')

au({'BufNewFile', 'BufRead', 'BufEnter'}, {
    'Jenkinsfile',
    function()
      vim.bo.filetype = 'java.jenkinsfile'
    end
})

au( {'VimEnter'}, {
    '*',
    function ()
      vim.fn.execute(':silent exec "!kill -s SIGWINCH $PPID"')
    end
  }
)
