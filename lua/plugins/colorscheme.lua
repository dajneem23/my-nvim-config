return { -- add gruvbox
{
    "ellisonleao/gruvbox.nvim",
    lazy = true
}, -- Configure LazyVim to load gruvbox
{
    "LazyVim/LazyVim",
    lazy = true,

    opts = {
        colorscheme = "gruvbox"
    }
}, {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
        style = "moon"
    }
}}
