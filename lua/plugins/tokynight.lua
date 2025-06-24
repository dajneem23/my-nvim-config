return  { "folke/tokyonight.nvim", lazy = false,
  opts = {
    style = "moon", -- "storm", "day", "night", "moon"
    transparent = true, -- enable transparent background
    terminal_colors = true, -- enable terminal colors
    styles = {
      sidebars = "transparent", -- style for sidebars
      floats = "transparent", -- style for floating windows
    },
  },
  config = function()
    -- Load the colorscheme
    vim.cmd("colorscheme tokyonight")
  end,
}