return {
  "phaazon/mind.nvim",
  branch = "v2.2",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("mind").setup({
      edit = {
        data_extension = ".norg",
        data_header = "* %s",
      },
      persistence = {
        data_dir = "~/Documents/home/",
        state_path = "~/Documents/home/notes.json",
      },
      ui = {
        width = 20,
        highlight = {
          node_root = "Number",
        },
      },
    })
  end,
  keys = {
    {
      "<leader>mc",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").create_node_index(
            args.get_tree(),
            require("mind").MoveDir.INSIDE_END,
            args.save_tree,
            args.opts
          )
        end)
      end,
      desc = "Create node",
    },
    {
      "<leader>Mc",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").create_node_index(
            args.get_tree(),
            require("mind.node").MoveDir.INSIDE_END,
            args.save_tree,
            args.opts
          )
        end)
      end,
      desc = "Create inner node",
    },
    {
      "<leader>mi",
      function()
        vim.notify("initializing project tree")
        require("mind").wrap_smart_project_tree_fn(function(args)
          local tree = args.get_tree()
          local mind_node = require("mind.node")

          local _, tasks = mind_node.get_node_by_path(tree, "/Tasks", true)
          tasks.icon = "陼"

          local _, backlog = mind_node.get_node_by_path(tree, "/Tasks/Backlog", true)
          backlog.icon = " "

          local _, on_going = mind_node.get_node_by_path(tree, "/Tasks/On-going", true)
          on_going.icon = " "

          local _, done = mind_node.get_node_by_path(tree, "/Tasks/Done", true)
          done.icon = " "

          local _, cancelled = mind_node.get_node_by_path(tree, "/Tasks/Cancelled", true)
          cancelled.icon = " "

          local _, notes = mind_node.get_node_by_path(tree, "/Notes", true)
          notes.icon = " "

          args.save_tree()
        end)
      end,
      desc = "Initialize smart project",
    },
    {
      "<leader>ml",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
        end)
      end,
    },
    {
      "<leader>Ml",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
        end)
      end,
    },
    {
      "<leader>j",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          local tree = args.get_tree()
          local path = vim.fn.strftime("/Journal/%Y/%b/%d")
          local _, node = require("mind.node").get_node_by_path(tree, path, true)

          if node == nil then
            vim.notify("cannot open journal 🙁", vim.log.levels.WARN)
            return
          end

          require("mind.commands").open_data(tree, node, args.data_dir, args.save_tree, args.opts)
          args.save_tree()
        end)
      end,
      desc = "Add Note to Journal",
    },
    {
      "<leader>Mm",
      "<cmd>MindOpenMain<CR>",
      desc = "Open Main Notes",
    },
    {
      "<leader>mm",
      "<cmd>MindOpenSmartProject<CR>",
      desc = "Open Smart Project",
    },
    {
      "<leader>ms",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
        end)
      end,
      desc = "Open note from the smart notes",
    },
    {
      "<leader>Ms",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
        end)
      end,
      desc = "Open note from main notes",
    },
  },

  dependencies = {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.norg.concealer"] = {
            config = {
              icon_preset = "diamond",
            },
          },
          ["core.norg.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      })
    end,
  },
}
