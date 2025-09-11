local map = vim.keymap.set
local set = vim.opt
local defaults = {
    noremap = true,
    silent = true
}
local telescope = require("telescope.builtin")
local wk = require("which-key")

-- vim.keymap.set("n", "<leader>p", telescope.find_files, { desc = "Find files" })
-- vim.keymap.set("n", "<leader>f", telescope.live_grep, { desc = "Live grep" })
-- vim.keymap.set("n", "<leader>fg", telescope.git_files, {
--     desc = "Git files"
-- })

-- vim.keymap.set("n", "<leader>c", telescope.git_commits, { desc = "Git commits" })

vim.keymap.set("n", "<leader>r", function()
    -- This will search for in the current working directory
    telescope.grep_string({
        search = vim.fn.input("Grep for > ")
    })
end, {
    desc = "Find string in current working directory",
    noremap = true,
    silent = true
})
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {
    buffer = bufnr,
    desc = "LSP references"
})
-- Auto-disable cursorline in Telescope popup
vim.api.nvim_create_autocmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
        vim.cmd("setlocal nocursorline")
    end
})

-- Next buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", {
    noremap = true,
    silent = true
})

-- Previous buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", {
    noremap = true,
    silent = true
})
-- vim.keymap.set("n", "<leader>q", ":bd<CR>", {
--     desc = "Close current buffer",
--     noremap = true,
--     silent = true
-- })
vim.keymap.set("n", "<leader>q", function()
    vim.cmd("bp | bd #")
end, {
    desc = "Close current buffer and go to previous"
})

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {
    desc = "Close current tab"
})

-- --new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", {
    desc = "New tab"
})
-- --close tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", {
    desc = "Close tab"
})
-- --close all tabs
vim.keymap.set("n", "<leader>ta", ":tabonly<CR>", {
    desc = "Close all tabs"
})

vim.keymap.set("n", "<leader>b", "<C-o>", {
    desc = "Jump back"
})
vim.keymap.set("n", "<leader>B", "<C-O>", {
    desc = "Jump forward"
})

-- Toggle file explorer

-- Toggle focus between Neo-tree and main editor

-- Toggle focus between vvim-tree and main editor
-- Toggle focus between neo-tree and editor, or open neo-tree if it's closed

-- https://github.com/bugb/dotfiles/blob/main/.config/nvim/core/options.lua
-- Keys notation table:
-- https://neovim.io/doc/user/intro.html#key-notation

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
set.termguicolors = true

-- Discovered it when using vim-forgit
-- https://github.com/ray-x/forgit.nvim/issues/1
set.shellcmdflag = '-ic'

-- Disable highlights results from your previous search
set.hlsearch = false

-- Disable scroll to end of file
set.scrolloff = 3

-- Keymaps--

-- Unmap Ctrl + q
map("n", "<C-q>", "", defaults)

-- Map jj to esc
map('i', 'jj', '<esc>l', defaults)

-- Map leader to <Space>
map("n", " ", "<Nop>", {
    silent = true,
    remap = false
})

-- Using <leader> + number (1, 2, ... 9) to switch tab
-- for i=1,9,1
-- do
--   map('n', '<leader>'..i, i.."gt", {})
-- end
-- map('n', '<leader>0', ":tablast<cr>", {})

-- map for quick quit, save files using leader key
---- Normal mode
map('n', '<Leader>w', ':write<CR>')
map('n', '<Leader>a', ':wqa<CR>')
map('n', '<Leader>x', ':wq<CR>')

---- Insert mode
map('i', ';w', '<esc>:write<CR>')
map('i', ';x', '<esc>:wq<CR>')

-- map for quick open the file init.lua
map('n', '<leader>nv', ':vsplit ~/.config/nvim/init.lua<cr>', {})

-- auto add closing {, [, (, ', ", <
-- map('i', '{<cr>', '{<cr>}<ESC>kA<CR>', {})
-- closing_pairs = {'}', ')', ']', '"', "'", '>'}
-- opening_pairs = {'{', '(', '[', '"', "'", '<'}
-- for key, chr in pairs(opening_pairs) do
--     map('i', chr, chr .. closing_pairs[key] .. '<esc>i', {})
-- end

-- use U for redo :))
map('n', 'U', '<C-r>', {})

-- map c and d to black hole registers
map('n', 'd', '"_d', {})
map('n', 'c', '"_c', {})
-- map('n', 'r', 'd', {})

-- scrolling
-- map('n', ',', '<C-u>', defaults)
-- map('n', 'm', '<C-d>', defaults)
-- map('n', 'M', 'm', defaults)

-- Insert empty line without entering insert mode
map('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
map('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)

-- Fast searching text under cursor with Goole with Ctrl+q Ctrl+g
-- I am using ArchLinux so I use the xdg-open command
-- For other file system it can be opEn
-- local searching_google_in_normal = [[:lua vim.fn.system({'xdg-open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
-- map("n", "<C-q><C-g>", searching_google_in_normal, defaults)

-- Select all text in the current buffer
map('n', '<leader>C', ':keepjumps normal! ggyG<cr>', defaults)

-- Toggle see whitespace characters like: eol, space, ...
set.lcs = 'tab:>-,eol:$,nbsp:X,trail:#'
map('n', '<F6>', ':set list!<cr>')

-- Ctrl + l to remove highlights and redraw your screen
map('n', '<C-l>', ':nohlsearch<cr>', defaults)

-- Alt/Meta + c to capitalize the inner word
map('n', '<M-c>', 'guiw~w', defaults)

-- Alt/Meta + u to capitalize the inner word
map('n', '<M-u>', 'gUiww', defaults)

-- Alt/Meta + l to capitalize the inner word
map('n', '<M-l>', 'guiww', defaults)

-- Shift + Up/Down to move line up/down
map('n', '<S-Up>', 'yyddkP', defaults)
map('n', '<S-Down>', 'yyddp', defaults)

-- Keymaps for Nvim tree
-- map('n', '<leader>e', ':NvimTreeToggle<cr>', defaults)
-- Toggle tree with Ctrl+n

-- Jump back to the tree with Ctrl+n
-- vim.keymap.set("n", "<C-n>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- map('n', '<leader>v', '<C-w>p', defaults) -- Jump back from tree to editor
-- map('n', '<leader>l', '<C-w>l', defaults)
map('n', '<C-Left>', '<C-w><Left>', defaults)
map('n', '<C-Right>', '<C-w><Right>', defaults)

-- Using H/L to go to the begining and the end of line
-- Note: H will map to _ (the first non-whitespace character of a line)
-- It would be helpful if it is a indent line in some languages like Python, Ruby, YAML, ...
map('n', 'H', '_', defaults)
map('n', 'L', '$', defaults)

---- Do some magic with autocmd
-- Remove trailing space
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*"},
    command = [[%s/\s\+$//e]]
})
-- Thank to the commit: https://github.com/vijaymarupudi/nvim-fzf-commands/issues/7
-- map('n', '<Leader>f', ':lua require("fzf-commands").files({command_flags="--hidden --exclude .git --exclude node_modules"})<CR>', defaults)

vim.keymap.set("n", "<leader>tT", ":tabnew | terminal<CR>", {
    desc = "Open terminal (new tab)",
    noremap = true,
    silent = true
})

vim.keymap.set("n", "<leader>pp", function()
    require("telescope.builtin").commands()
end, {
    desc = "Command Palette (like VS Code)"
})

vim.keymap.set("n", "<leader>/", "gcc", {
    remap = true,
    desc = "Toggle comment"
})
vim.keymap.set("v", "<leader>/", "gc", {
    remap = true,
    desc = "Toggle comment (visual)"
})

vim.keymap.set('n', '<leader>rt', function()
    local cwd = vim.fn.getcwd()
    local open_cmd = "open -a iTerm '" .. cwd .. "'" -- macOS with iTerm
    -- local open_cmd = "gnome-terminal --working-directory='" .. cwd .. "'" -- Linux
    vim.fn.system(open_cmd)
end, {
    noremap = true,
    silent = true
})

-- Expand all: Option + o

vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {})
vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
-- buffer last
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', {})
-- from tree to previous buffer
vim.keymap.set('n', '<leader>p', '<Cmd>BufferLineGoToBuffer -1<CR>', {
    desc = "Go to previous buffer"
})

-- https://github.com/alextricity25/nvim_weekly_plugin_configs/blob/01b77d3f41a2c429d397f37a2901e40b47bd6507/lua/keymappings.lua
local function visual_cursors_with_delay()
    -- Execute the vm-visual-cursors command.
    vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
    -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
    vim.cmd('sleep 200m')
    -- Press 'A' in normal mode after the delay.
    vim.cmd('silent! execute "normal! A"')
end

wk.register({
    m = {
        name = "Visual Multi",
        a = {
            "<Plug>(VM-Select-All)<Tab>",
            "Select All",
            mode = {"n"}
        },
        r = {
            "<Plug>(VM-Start-Regex-Search)",
            "Start Regex Search",
            mode = {"n"}
        },
        p = {
            "<Plug>(VM-Add-Cursor-At-Pos)",
            "Add Cursor At Pos",
            mode = {"n"}
        },
        v = {
            visual_cursors_with_delay,
            "Visual Cursors",
            mode = {"v"}
        },
        o = {
            "<Plug>(VM-Toggle-Mappings)",
            "Toggle Mapping",
            mode = {"n"}
        },
        d = {
            "<Plug>(VM-Select-Next-Occurrence)",
            "Select Next Occurrence",
            mode = {"n"}
        },
        D = {
            "<Plug>(VM-Select-Previous-Occurrence)",
            "Select Previous Occurrence",
            mode = {"n"}
        },
        c = {
            "<Plug>(VM-Select-Current-Word)",
            "Select Current Word",
            mode = {"n"}
        },
        s = {
            "<Plug>(VM-Select-Next-Character)",
            "Select Next Character",
            mode = {"n"}
        },
        S = {
            "<Plug>(VM-Select-Previous-Character)",
            "Select Previous Character",
            mode = {"n"}
        },
        i = {
            "<Plug>(VM-Select-Next-Inner-Word)",
            "Select Next Inner Word",
            mode = {"n"}
        },
        I = {
            "<Plug>(VM-Select-Previous-Inner-Word)",
            "Select Previous Inner Word",
            mode = {"n"}
        },
        l = {
            "<Plug>(VM-Select-Next-Line)",
            "Select Next Line",
            mode = {"n"}
        },
        L = {
            "<Plug>(VM-Select-Previous-Line)",
            "Select Previous Line",
            mode = {"n"}
        }
    },
    t = {
        name = "Trouble",
        d = {"<cmd>Trouble document_symbols toggle focus=true<cr>", "Document Symbols"},
        D = {"<cmd>Trouble document_symbols toggle focus=false<cr>", "Document Symbols (All)"},
        r = {"<cmd>Trouble lsp_references toggle focus=true<cr>", "LSP References"},
        x = {"<cmd>Trouble diagnostics toggle<cr>", "Diagnostics"},
        X = {"<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics"},
        ts = {"<cmd>Trouble symbols toggle focus=false<cr>", "Symbols"},
        l = {"<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP References"},
        L = {"<cmd>Trouble loclist toggle<cr>", "Location List"},
        Q = {"<cmd>Trouble qflist toggle<cr>", "Quickfix List"}
    },
    z = {
        name = "LSP",
        r = {function()
            vim.lsp.buf.rename()
        end, "Rename symbol"},
        a = {function()
            vim.lsp.buf.code_action()
        end, "Code Action"},
        -- f = {function()
        --     vim.lsp.buf.format({
        --         async = true
        --     })
        -- end, "Format"},
        -- f to fold brakets
        ["."] = {function()
            LazyVim.lsp.action["source.addMissingImports.ts"]()
        end, "Add missing imports"},
        -- line disgnostics
        l = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics"},
        -- buffer diagnostics
        L = {"<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer Diagnostics"},
        -- workspace diagnostics
        w = {"<cmd>Telescope diagnostics<CR>", "Workspace Diagnostics"},
        -- 📄 Show symbols in the current file
        s = {"<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols"},

        -- 🧠 Show symbols across the entire workspace/project
        S = {"<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols"},
        x = {"<cmd>Trouble diagnostics toggle<cr>", "Diagnostics"},
        X = {"<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics"},
        d = {"<cmd>Trouble lsp_definitions toggle focus=true<cr>", "LSP Definitions"},
        D = {"<cmd>Trouble lsp_definitions toggle focus=false<cr>", "LSP Definitions (All)"},
        g = {function()
            local telescope = require("telescope.builtin")
            vim.ui.input({
                prompt = "Grep for > "
            }, function(input)
                if input and input ~= "" then
                    telescope.grep_string({
                        search = input
                    })
                end
            end)
        end, "Grep String"},
        --toggle comment 
        ["/"] =  {"gcc", "Toggle Comment"}
    },
    w = {
        name = "Window",
        s = {"<C-w>s", "Split window horizontally"},
        v = {"<C-w>v", "Split window vertically"},
        h = {"<C-w>h", "Move to left window"},
        j = {"<C-w>j", "Move to bottom window"},
        k = {"<C-w>k", "Move to top window"},
        l = {"<C-w>l", "Move to right window"},
        c = {"<C-w>c", "Close current window"},
        o = {"<C-w>o", "Close other windows"},
        qh = {"<C-w>h :q<CR> <C-w>l", "Close left window"},
        qj = {"<C-w>j :q<CR> <C-w>l", "Close bottom window"},
        qk = {"<C-w>k :q<CR> <C-w>l", "Close top window"},
        ql = {"<C-w>l :q<CR> <C-w>l", "Close right window"}
    }
}, {
    prefix = "<leader>"
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.format {
--             async = false
--         }
--     end
-- })
-- Load Noice extension for Telescope
require("telescope").load_extension("noice")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", {
    desc = "Move line down"
})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", {
    desc = "Move line up"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.b.noice_disable = true
    end
})

vim.diagnostic.config({
    virtual_text = false, -- disables inline red text
    update_in_insert = false
})


vim.api.nvim_create_autocmd({"ModeChanged"}, {
    pattern = "*:[vV\x16]", -- entering visual modes
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.cursorcolumn = false
    end
})

vim.api.nvim_create_autocmd({"ModeChanged"}, {
    pattern = "[vV\x16]:n", -- leaving visual modes
    callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.cursorcolumn = false -- optional
    end
})
-- <leader>uf: toggle autoformat on save

-- close bottom 
-- Normal mode: select previous/next word
vim.keymap.set("n", "<S-Left>", "vB", {
    noremap = true,
    silent = true,
    desc = "Select word left"
})
vim.keymap.set("n", "<S-Right>", "vE", {
    noremap = true,
    silent = true,
    desc = "Select word right"
})

-- Visual mode: extend selection
vim.keymap.set("v", "<S-Left>", "B", {
    noremap = true,
    silent = true,
    desc = "Extend left"
})
vim.keymap.set("v", "<S-Right>", "E", {
    noremap = true,
    silent = true,
    desc = "Extend right"
})

vim.keymap.set("n", "ff", function()
    local word = vim.fn.expand("<cword>")
    require("telescope.builtin").live_grep({
        default_text = word
    })
end, {
    noremap = true,
    silent = true,
    desc = "Grep word under cursor"
})
-- -- find word under cursor in current file
-- vim.keymap.set("n", "<leader>fw", function()
--     local word = vim.fn.expand("<cword>")
--     require("telescope.builtin").grep_string({
--         search = word
--     })
-- end, {
--     desc = "Find word under cursor in current file"
-- })


vim.keymap.set("n", "<leader>rw", function()
    local word = vim.fn.expand("<cword>")

    vim.ui.input({
        prompt = "Replace '" .. word .. "' with: "
    }, function(input)
        if input and #input > 0 then
            -- Escape special characters for pattern
            local escaped_word = vim.fn.escape(word, "\\/.*$^~[]")
            local escaped_input = vim.fn.escape(input, "\\/")

            vim.cmd(":%s/\\<" .. escaped_word .. "\\>/" .. escaped_input .. "/g")
        else
            print("Cancelled.")
        end
    end)
end, {
    desc = "Replace word under cursor globally"
})

-- 'we' = end of word
vim.keymap.set("n", "we", "$", {
    noremap = true
})

-- 'wq' = start of line
vim.keymap.set("n", "wq", "^", {
    noremap = true
})

-- wk to buffer above current
vim.keymap.set("n", "wk", "<C-w>k", {
    noremap = true,
    silent = true,
    desc = "Go to upper window"
})
-- wj to buffer below current
vim.keymap.set("n", "wj", "<C-w>j", {
    noremap = true,
    silent = true,
    desc = "Go to lower window"
})
-- wh to buffer left of current
vim.keymap.set("n", "wh", "<C-w>h", {
    noremap = true,
    silent = true,
    desc = "Go to left window"
})
-- wl to buffer right of current
vim.keymap.set("n", "wl", "<C-w>l", {
    noremap = true,
    silent = true,
    desc = "Go to right window"
})
-- w[ to go to start bracket
vim.keymap.set("n", "w[", "%", {
    noremap = true,
    silent = true,
    desc = "Go to matching bracket"
})
-- w] to go to end bracket
vim.keymap.set("n", "w]", "%", {
    noremap = true,
    silent = true,
    desc = "Go to matching bracket"
})

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<space><space>", function()
  if vim.bo.filetype == "neo-tree" then
    -- get node under cursor in Neo-tree
    local state = require("neo-tree.sources.manager").get_state("filesystem")
    local node = state.tree:get_node()
    local path = node.type == "directory" and node.path or vim.fn.fnamemodify(node.path, ":h")
    telescope.find_files({ cwd = path,
        prompt_title = "Find files in " .. vim.fn.fnamemodify(path, ":t"),
  })
  else
    -- fallback to LazyVim default (project root)
    telescope.find_files({ cwd = require("lazyvim.util").root(),
        prompt_title = "Find files in " .. vim.fn.fnamemodify(require("lazyvim.util").root(), ":t"),
  })
  end
end, { desc = "Find files (smart: root or Neo-tree folder)" })

-- vg => select all 
vim.keymap.set("n", "vg", "ggVG$", {
    noremap = true,
    silent = true,
    desc = "Select all"
})
-- •	vaf → select a function (including fn foo() { ... })
-- •	vif → select inner function body (just inside { ... })