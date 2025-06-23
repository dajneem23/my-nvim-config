local builtin = require('telescope.builtin')
local map = vim.keymap.set
local set = vim.opt
local defaults = { noremap = true, silent = true }
local telescope = require("telescope.builtin")
-- Telescope

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
for i=1,9,1
do
  map('n', '<leader>'..i, i.."gt", {})
end
map('n', '<leader>0', ":tablast<cr>", {})


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
map('n', ',', '<C-u>', defaults)
map('n', 'm', '<C-d>', defaults)
map('n', 'M', 'm', defaults)

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
map('n', '<leader>e', ':NvimTreeToggle<cr>', defaults)
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