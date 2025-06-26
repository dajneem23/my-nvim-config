return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local api = require("nvim-tree.api")
        -- keymaps
        -- vim.keymap.set("n", "<leader><leader>", ":b ", {
        --     desc = "pick buffer"
        -- })
        -- vim.keymap.set("n", "-", function()
        --     if api.tree.is_visible() then
        --         api.tree.close()
        --     else
        --         api.tree.open()
        --         vim.cmd("wincmd p") -- no focus
        --     end
        -- end, {
        --     desc = "toggle buffer tree",
        --     silent = true
        -- })
        -- hide buffer bar when open
        -- api.events.subscribe(api.events.Event.TreeOpen, function(data)
        --     -- close by default
        --     -- reset no_buffer filter
        --     -- TODO: unapply filter if no buffers open
        --     if not require("nvim-tree.explorer.filters").config.filter_no_buffer then
        --         require("nvim-tree.explorer.filters").config.filter_no_buffer = true
        --         require("nvim-tree.actions.reloaders.reloaders").reload_explorer()
        --     end
        --     -- expand all folders
        --     api.tree.expand_all()
        --     -- hide bufferbar
        --     require("lualine").hide({
        --         place = {"tabline"}
        --     })

        -- end)
        -- open tree on startup if we are in a directory

        -- api.events.subscribe(api.events.Event.TreeClose, function(data)
        --     require("lualine").hide({
        --         place = {"tabline"},
        --         unhide = true
        --     })
        -- end)
        -- close buffer tree if we're the last window around
        -- vim.api.nvim_create_autocmd({"QuitPre"}, {
        --     group = vim.api.nvim_create_augroup("autoclose_tree", {
        --         clear = true
        --     }),
        --     callback = function()
        --         local wins = vim.api.nvim_list_wins()
        --         local realwins = #wins - 1 -- the one being closed has to be subtracted
        --         for i, w in ipairs(wins) do
        --             local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
        --             if bufname == "" or bufname:match("NvimTree_") ~= nil then
        --                 realwins = realwins - 1
        --             end
        --         end
        --         if realwins < 1 then
        --             vim.cmd("NvimTreeClose")
        --         end
        --     end
        -- })
        require("nvim-tree").setup({
            update_focused_file = {
                enable = false
            },
            view = {
                width = 40
            },
            modified = {
                enable = true
            },
            diagnostics ={
                enable = false,
                show_on_dirs = true, -- show diagnostics on directories
                debounce_delay = 50, -- delay for diagnostics
                severity = {
                    min = vim.diagnostic.severity.WARN, -- only show warnings and errors
                    max = vim.diagnostic.severity.ERROR
                }
            },
            actions = {
                change_dir = {
                    restrict_above_cwd = true
                }
            },
            filters = {
                dotfiles = false, -- show dotfiles
                custom = {"^.git$"} -- only hide .git folder
            },
            git = {
                enable = false,-- erorr 
                ignore = false -- <== important to show node_modules
            },
            renderer = {
                -- indent_markers = {
                --     enable = true
                -- },
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "✚",
                            staged = "●",
                            unmerged = "",
                            renamed = "»",
                            untracked = "…",
                            deleted = "✖",
                            ignored = "◌"
                        }
                    }
                }
            }
        })
    end
}

-- vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
-- vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
-- vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
-- vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
-- vim.keymap.set("n", "<S-Tab>", function()
--     api.node.navigate.opened.prev()
--     api.node.open.edit()
-- end, opts("Open Prev"))
-- vim.keymap.set("n", "<Tab>", function()
--     api.node.navigate.opened.next()
--     api.node.open.edit()
-- end, opts("Open Next"))
-- vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
-- vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
-- vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
-- vim.keymap.set("n", "a", api.fs.create, opts("Create"))
-- vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
-- vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
-- vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
-- vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
-- vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
-- vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
-- vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
-- vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
-- vim.keymap.set("n", "-", api.tree.close, opts("Close"))
-- vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
-- vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))

-- vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
-- vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
-- vim.keymap.set("n", "q", api.tree.close, opts("Close"))
-- vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
-- vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
-- vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
-- vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
-- vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
-- vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
-- vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy"))
-- vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
