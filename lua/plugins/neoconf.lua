return {
    "folke/neoconf.nvim",
    init = function()
        require("neoconf").setup({
            -- log_level = vim.log.levels.DEBUG,
            log_file = "/Users/tranthanh/.config/nvim/neoconf.log",
            log_to_file = true,
            -- log_to_console = true,
            auto_reload = true,
            -- auto_reload_delay = 1000,
            -- auto_reload_on_write = true,
            -- auto_reload_on_change = true
        })
    end
}
