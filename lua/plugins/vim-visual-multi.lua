--https://github.com/alextricity25/nvim_weekly_plugin_configs/blob/01b77d3f41a2c429d397f37a2901e40b47bd6507/lua/plugins_lazy.lua#L76
return     {
        'mg979/vim-visual-multi',
        -- See https://github.com/mg979/vim-visual-multi/issues/241
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ['Find Under'] = '<C-d>'
            }
            vim.g.VM_add_cursor_at_pos_no_mappings = 1
            
        end,
    }