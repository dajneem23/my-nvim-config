require("lazy").setup({
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "cyberdream",
    },
    import = "lazyvim.plugins",
  },
  -- Merged from plugins/init.lua: LazyVim Extras
-- { import = "lazyvim.plugins.extras.formatting.prettier" },
-- { import = "lazyvim.plugins.extras.linting.eslint" },
-- { import = "lazyvim.plugins.extras.lang.typescript" },

  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  -- End of merged extras
  { import = "plugins" },
}, {
  -- Configure any other `lazy.nvim` configuration options here
  install = {
    colorscheme = { "gruvbox", "habamax" },
  },
  ui = {
    backdrop = 100,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "zipPlugin" },
    },
  },
}) --[[@as LazyConfig]]
