-- fix for nvim v0,11
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- views = {
        --     cmdline_popup = {
        --         border = {
        --             style = "none",
        --             padding = {2, 3}
        --         },
        --         filter_options = {},
        --         win_options = {
        --             winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        --         }
        --     }
        -- }
        -- views = {
        --     cmdline_popup = {
        --         relative = "editor",
        --         position = {
        --             row = 5,
        --             col = "50%"
        --         },
        --         size = {
        --             width = 60,
        --             height = "auto"
        --         },
        --         -- win_options = {
        --         --     winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        --         -- }
        --     },
        --     popupmenu = {
        --         relative = "editor",
        --         position = {
        --             row = 10,
        --             col = "30%"
        --         },
        --         size = {
        --             width = 60,
        --             height = 10
        --         },
        --         border = {
        --             style = "rounded",
        --             padding = {0, 1}
        --         },
        --         win_options = {
        --             winhighlight = {
        --                 Normal = "Normal",
        --                 FloatBorder = "DiagnosticInfo"
        --             }
        --         }
        --     }
        -- }
        lsp = {
            signature = {
                enabled = false, -- disable signature help by default
                auto_open = {
                    enabled = false, -- disable auto opening of signature help
                    trigger = false -- disable auto opening on typing
                }
            },
            --✅ Fix: Disable LSP Hover UI in Noice
            hover = {
                enabled = false
            },
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true -- requires hrsh7th/nvim-cmp
            }
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false -- add a border to hover docs and signature help
        }
    },
    dependencies = { -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim", -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify"}
}
