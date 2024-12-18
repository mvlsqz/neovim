return {
  "saghen/blink.cmp",
  opts = {
    keymap = { preset = "enter" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "markdown" },
      providers = {
        markdown = { name = "RenderMarkdown", module = "render-markdown.integ.blink" },
      },
    },
  },
}
