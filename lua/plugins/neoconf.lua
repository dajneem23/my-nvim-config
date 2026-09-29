return {
  "folke/neoconf.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    log_file = vim.fn.stdpath "config" .. "/neoconf.log",
    log_to_file = true,
    auto_reload = true,
  },
}
