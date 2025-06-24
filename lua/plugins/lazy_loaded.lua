return {
  -- by enabling the lazy option, the plugin will automatically be lazy loaded
  -- until it's module is called for example require("tokyonight")


  -- this plugin will be loaded when using `:ZenMode`
  { "folke/zen-mode.nvim", cmd = "ZenMode" },

  -- this plugin will be loaded when opening a "markdown" file
  { "lukas-reineke/headlines.nvim", ft = "markdown" },

  -- this plugin will be loaded when pressing Alt+{h,j,k,l}
  {
    "echasnovski/mini.move",
    keys = {
      { "<M-h>", mode = { "v", "n" } },
      { "<M-j>", mode = { "v", "n" } },
      { "<M-k>", mode = { "v", "n" } },
      { "<M-l>", mode = { "v", "n" } },
    },
  },

  -- this plugin will be loaded on the autocmd event "UIEnter"
  { "rebelot/heirline.nvim", event = "UIEnter" },
}