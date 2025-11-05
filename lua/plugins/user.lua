-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:
---@type LazySpec
return { -- == Examples of Adding Plugins ==
-- customize dashboard options
{
    "folke/snacks.nvim",
    opts = {
        dashboard = {
            preset = {
                header = table.concat(
                    {" ███    ██  ██████  ███████  ██████  ",
                     "████   ██ ██    ██ ██       ██    ██ ",
                     "██ ██  ██ ██    ██ ███████  ██    ██ ",
                     "██  ██ ██ ██    ██       ██  ██    ██ ",
                     "██   ████  ██████  ███████  ██████  ",
                     "", "███    ██ ██    ██ ██ ███    ███",
                     "████   ██ ██    ██ ██ ████  ████",
                     "██ ██  ██ ██    ██ ██ ██ ████ ██",
                     "██  ██ ██  ██  ██  ██ ██  ██   ██",
                     "██   ████   ████   ██ ██      ██"}, "\n")
            },
            buttons = {{"f", " " .. " Find File", ":Telescope find_files<CR>"},
                       {"n", " " .. " New File", ":ene!<CR>"},
                       {"r", " " .. " Recent Files", ":Telescope oldfiles<CR>"},
                       {"g", " " .. " Find Text", ":Telescope live_grep<CR>"},
                       {"s", " " .. " Settings", ":e $MYVIMRC<CR>"}, {"q", " " .. " Quit", ":qa<CR>"},
                       {"l", "󰒲 " .. " Lazy", ":Lazy<CR>"},
                       {"c", " " .. " Config", ":e ~/.config/nvim/lua/plugins/user.lua<CR>"},
                       {"u", " " .. " Update", ":Lazy update<CR>"}}
        }

    }
}, -- You can disable default plugins as follows:
{
    "max397574/better-escape.nvim",
    enabled = false
}}
