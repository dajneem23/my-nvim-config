-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

vim.opt.termguicolors = true

-- prevent cursorline from being highlighted in visual mode
vim.opt.lazyredraw = true
vim.opt.cursorline = false
vim.opt.foldenable = false

-- prevent blinking cursor when save
vim.opt.visualbell = true
vim.opt.errorbells = false
vim.opt.belloff = "all"
-- vim.opt.number = true -- Show absolute line number (left gutter)
-- vim.opt.relativenumber = true -- Show relative line numbers
-- vim.o.statuscolumn = "%s %l %r"

vim.g.autoformat_enabled = false

-- This tells Neovim to capture mouse scroll instead of passing it to the terminal.
vim.o.mouse = "a"

-- vim.o.relativenumber = true
-- vim.o.number = true
-- vim.api.nvim_set_hl(0, 'StatusColumnLineNr', {
--     fg = '#585b70',
--     bg = 'NONE'
-- })
-- vim.api.nvim_set_hl(0, 'StatusColumnLineNrCursor', {
--     fg = '#f9e2af',
--     bg = 'Black',
--     reverse = true
-- })

-- vim.o.statuscolumn = table.concat {'%@SignCb@', -- Clickable sign column
-- '%s', -- Sign column
-- '%=', -- Right align
-- -- Absolute line number (current line)
-- '%#StatusColumnLineNrCursor#', "%{v:virtnum == 0 ? (v:lnum == line('.') ? v:lnum : '') : ''}",

-- -- Absolute line number (non-current line)
--                                    '%#StatusColumnLineNr#',
--                                    "%{v:virtnum == 0 ? (v:lnum == line('.') ? '' : v:lnum) : ''}",

-- -- Padding space (current line)
--                                    '%#StatusColumnLineNrCursor#', "%{v:virtnum == 0 ? (v:relnum == 0 ? ' ' : '') : ''}",

-- -- Padding space (non-current line)
--                                    '%#StatusColumnLineNr#', "%{v:virtnum == 0 ? (v:relnum == 0 ? '' : ' ') : ''}",

-- -- Relative line number (current line)
--                                    '%#StatusColumnLineNrCursor#',
--                                    "%-2{v:virtnum == 0 ? (v:relnum == 0 ? v:relnum : '') : ''}",

-- -- Relative line number (non-current line)
--                                    '%#StatusColumnLineNr#',
--                                    "%-2{v:virtnum == 0 ? (v:relnum == 0 ? '' : v:relnum) : ''}", '│ ' -- Separator
-- }

-- :help vim.wo

-- . Terminal Bell / Visual Bell
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.belloff = "all"
-- vim.opt.t_vb = ""
vim.opt.cursorline = false
vim.opt.cursorcolumn = false

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end


require "lazy_setup"
require "polish"


require("user.keymaps")

-- Normal & Visual mode mappings
vim.keymap.set({'n', 'v'}, '<M-Left>', '^', {
    noremap = true,
    silent = true
}) -- start of line
vim.keymap.set({'n', 'v'}, '<M-Right>', 'g_', {
    noremap = true,
    silent = true
}) -- end of line (non-blank)

-- Insert mode mappings
vim.keymap.set('i', '<M-Left>', '<C-o>^', {
    noremap = true,
    silent = true
})
vim.keymap.set('i', '<M-Right>', '<C-o>g_', {
    noremap = true,
    silent = true
})


-- vim.opt.wrap = true -- soft-wrap text
-- vim.opt.linebreak = true -- wrap only at word boundaries
-- vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.whichwrap = "b,s"
vim.opt.iskeyword:remove({")", "]", "}"})
