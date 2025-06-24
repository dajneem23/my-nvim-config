return {
  "catppuccin/nvim", 
  lazy = true, -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
  name = "catppuccin", 
  priority = 1001,
  config = function()
require("catppuccin").setup {
    flavour = "latte", -- latte, frappe, macchiato, mocha
    color_overrides = {
        all = {
            text = "#ffffff",
        },
        latte = {
            base = "#ff0000",
            mantle = "#242424",
            crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = {},
    }
}
    -- vim.cmd("colorscheme catppuccin")
  end,
}