local configs = require("configs")
return {
  {
    "mvlsqz/mind.nvim",
    version = "v2.2",
    cmd = "MindOpenMain",
    dependencies = configs.dependencies.mind,
    config = configs.config.mind,
    keys = configs.keys.mind,
  },
}
