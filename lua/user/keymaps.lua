local builtin = require('telescope.builtin')
local map = vim.keymap.set
local set = vim.opt
local defaults = { noremap = true, silent = true }
local telescope = require("telescope.builtin")
local wk = require("which-key")


-- vim.keymap.set("n", "<leader>p", telescope.find_files, { desc = "Find files" })
-- vim.keymap.set("n", "<leader>f", telescope.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fg", telescope.git_files, { desc = "Git files" })
-- vim.keymap.set("n", "<leader>c", telescope.git_commits, { desc = "Git commits" })
map('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set("n", "<leader>fc", function()
    -- This will search for in the current working directory
  telescope.grep_string({ search = vim.fn.input("Grep for > ") })
end, { desc = "Find 'console.log' usages" })
-- map('n', '<leader>fg', builtin.live_grep, {})
-- map('n', '<leader>fb', builtin.buffers, {})
-- map('n', '<leader>fh', builtin.help_tags, {})

-- Next buffer
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })

-- Previous buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close current buffer", noremap = true, silent = true })

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })

-- --new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
-- --close tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
-- --close all tabs
vim.keymap.set("n", "<leader>ta", ":tabonly<CR>", { desc = "Close all tabs" })


vim.keymap.set("n", "<leader>b", "<C-o>", { desc = "Jump back" })
vim.keymap.set("n", "<leader>B", "<C-i>", { desc = "Jump forward" })


-- Toggle file explorer
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
end, { desc = "Toggle file explorer" })

-- Toggle focus between Neo-tree and main editor
vim.keymap.set("n", "<leader><Tab>", function()
  local current = vim.api.nvim_get_current_win()
  local neo_tree_win = nil

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("neo%-tree") then
      neo_tree_win = win
      break
    end
  end

  if neo_tree_win and current ~= neo_tree_win then
    vim.api.nvim_set_current_win(neo_tree_win) -- focus neo-tree
  else
    vim.cmd("wincmd l") -- go right to main editor
  end
end, { desc = "Toggle focus between Neo-tree and editor" })
-- Toggle focus between vvim-tree and main editor
-- Toggle focus between neo-tree and editor, or open neo-tree if it's closed
vim.keymap.set("n", "<M-Tab>", function()
  local current_win = vim.api.nvim_get_current_win()
  local neo_tree_win = nil

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "neo-tree" then
      neo_tree_win = win
      break
    end
  end

  if neo_tree_win then -- if neo-tree is open
    if current_win == neo_tree_win then -- and focused
      vim.cmd("wincmd p") -- focus previous window (editor)
    else -- and not focused
      vim.api.nvim_set_current_win(neo_tree_win) -- focus neo-tree
    end
  else
    require("nvim-tree.api").tree.focus() -- jump to tree
    -- if neo-tree is not open, open it
    -- require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
  end
end, { desc = "Toggle focus Neo-tree/editor" })
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
map("n", " ", "<Nop>", { silent = true, remap = false })



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
map('i', '{<cr>', '{<cr>}<ESC>kA<CR>', {})
closing_pairs = {'}', ')', ']', '"', "'", '>'}
opening_pairs = {'{', '(', '[', '"', "'", '<'}
for key, chr in pairs(opening_pairs)
do
  map('i', chr, chr..closing_pairs[key]..'<esc>i', {})
end

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
local searching_google_in_normal = [[:lua vim.fn.system({'xdg-open', 'https://google.com/search?q=' .. vim.fn.expand("<cword>")})<CR>]]
map("n", "<C-q><C-g>", searching_google_in_normal, defaults)

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
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

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
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
--Thank to the commit: https://github.com/vijaymarupudi/nvim-fzf-commands/issues/7
--map('n', '<Leader>f', ':lua require("fzf-commands").files({command_flags="--hidden --exclude .git --exclude node_modules"})<CR>', defaults)


vim.keymap.set("n", "<leader>tT", ":tabnew | terminal<CR>", { desc = "Open terminal (new tab)", noremap = true, silent = true })


vim.keymap.set("n", "<leader>pp", function()
  require("telescope.builtin").commands()
end, { desc = "Command Palette (like VS Code)" })


vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment (visual)" })

vim.keymap.set('n', '<leader>rt', function()
  local cwd = vim.fn.getcwd()
  local open_cmd = "open -a iTerm '" .. cwd .. "'"  -- macOS with iTerm
  -- local open_cmd = "gnome-terminal --working-directory='" .. cwd .. "'" -- Linux
  vim.fn.system(open_cmd)
end, { noremap = true, silent = true })


local treeApi = require("nvim-tree.api")

-- Collapse all: Option + c
vim.keymap.set('n', '<M-c>', function()
  treeApi.tree.focus()
  treeApi.tree.collapse_all()
end, { noremap = true, silent = true, desc = "NvimTree: Collapse All" })


-- Expand all: Option + o
vim.keymap.set('n', '<M-o>', function()
  treeApi.tree.focus()
  treeApi.tree.expand_all()
end, { noremap = true, silent = true, desc = "NvimTree: Expand All" })


vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', {}) 
vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', {})
--buffer last
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', {})
-- from tree to previous buffer
vim.keymap.set('n', '<leader>p', '<Cmd>BufferLineGoToBuffer -1<CR>', { desc = "Go to previous buffer" })


--https://github.com/alextricity25/nvim_weekly_plugin_configs/blob/01b77d3f41a2c429d397f37a2901e40b47bd6507/lua/keymappings.lua
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
    a = { "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
    r = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
    p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
    v = { visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
    o = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
    d = { "<Plug>(VM-Select-Next-Occurrence)", "Select Next Occurrence", mode = { "n" } },
    D = { "<Plug>(VM-Select-Previous-Occurrence)", "Select Previous Occurrence", mode = { "n" } },
    c = { "<Plug>(VM-Select-Current-Word)", "Select Current Word", mode = { "n" } },
    s = { "<Plug>(VM-Select-Next-Character)", "Select Next Character", mode = { "n" } },
    S = { "<Plug>(VM-Select-Previous-Character)", "Select Previous Character", mode = { "n" } },
    i = { "<Plug>(VM-Select-Next-Inner-Word)", "Select Next Inner Word", mode = { "n" } },
    I = { "<Plug>(VM-Select-Previous-Inner-Word)", "Select Previous Inner Word", mode = { "n" } },
    l = { "<Plug>(VM-Select-Next-Line)", "Select Next Line", mode = { "n" } },
    L = { "<Plug>(VM-Select-Previous-Line)", "Select Previous Line", mode = { "n" } },
    
  }
}, { prefix = "<leader>" })