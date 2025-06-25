return {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false
        })
        vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", {
            desc = "Copilot Accept Word"
        })

        vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", {
            desc = "Copilot Dismiss Suggestion"
        })
    end
}
