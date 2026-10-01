# My LazyVim Configuration

This is my personal LazyVim configuration.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## ✨ Plugins

Here is a list of the main plugins used in this configuration:

- **[LazyVim](https://github.com/LazyVim/LazyVim):** The Neovim distribution this configuration extends.
- **[aerial.nvim](https://github.com/stevearc/aerial.nvim):** A code outline window for skimming and quick navigation.
- **[catppuccin](https://github.com/catppuccin/nvim):** A soothing pastel theme for the high-spirited programmer.
- **[copilot.vim](https://github.com/github/copilot.vim):** GitHub Copilot for Neovim.
- **[error-lens.nvim](https://github.com/yamatsum/error-lens.nvim):** A plugin that highlights diagnostics inline.
- **[heirline.nvim](https://github.com/rebelot/heirline.nvim):** A statusline plugin for Neovim.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A blazing fast and easy to configure statusline for Neovim.
- **[mason.nvim](https://github.com/mason-org/mason.nvim):** Portable package manager for Neovim that runs everywhere Neovim runs.
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim):** A file explorer for Neovim.
- **[noice.nvim](https://github.com/folke/noice.nvim):** Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
- **[blink.cmp](https://github.com/Saghen/blink.cmp):** Completion engine used by the current LazyVim setup.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** A collection of configurations for the built-in LSP client.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify):** A fancy, configurable, notification manager for Neovim.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Treesitter configurations and abstraction layer for Neovim.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):** A highly extendable fuzzy finder over lists.
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim):** A clean, dark Neovim theme written in Lua.
- **[trouble.nvim](https://github.com/folke/trouble.nvim):** A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- **[which-key.nvim](https://github.com/folke/which-key.nvim):** A popup for keybindings.

## ⌨️ Keymaps

`<leader>` is `<Space>`. `N`, `V`, and `I` mean Normal, Visual, and Insert mode. This reference includes every global `<leader>` map active in this configuration, every global custom map, and the configured filetype/plugin-local maps. Use `<leader>sk` for a live, searchable list.

### Global editing and navigation

| Mode | Keymap | Description |
|---|---|---|
| I | `jj` | Leave Insert mode |
| N | `<C-q>` | Disabled |
| N | `U` | Redo |
| N | `d` / `c` | Delete / change without replacing the unnamed register |
| N | `H` / `L` | First non-blank character / end of line |
| N | `<C-l>` | Clear search highlighting |
| N | `<F6>` | Toggle visible whitespace |
| N | `<M-c>` / `<M-u>` / `<M-l>` | Toggle case / uppercase word / lowercase word |
| N | `<S-Up>` / `<S-Down>` | Move the current line up / down |
| N | `<A-j>` / `<A-k>` | Move the current line down / up |
| N | `<C-Left>` / `<C-Right>` | Move to the window on the left / right |
| N | `wk` / `wj` / `wh` / `wl` | Move to upper / lower / left / right window |
| N | `w[` / `w]` | Jump to matching bracket |
| N | `vg` | Select the whole buffer |
| N | `ff` | Grep the word under the cursor |
| N | `gr` | Show LSP references in Telescope |
| N | `<S-Left>` / `<S-Right>` | Select the word to the left / right |
| V | `<S-Left>` / `<S-Right>` | Extend selection left / right |
| N, V | `<D-Left>` / `<D-Right>` | Start / end of line (macOS Command-arrow) |
| N, V | `<M-Left>` / `<M-Right>` | Previous / next word (macOS Option-arrow) |
| I | `;w` / `;x` | Save / save and quit |
| I | `<D-Left>` / `<D-Right>` | Start / end of line |
| I | `<M-Left>` / `<M-Right>` | Previous / next word |
| N, I | `<Esc>[1;9C` / `<Esc>[1;9D>` | Terminal fallback: end / start of line |
| N, V, I | `<Esc>gg`, `<Esc>G`, `<Esc>^`, `<Esc>$` | Terminal navigation fallbacks |

### Buffers, tabs, files, and windows

| Mode | Keymap | Description |
|---|---|---|
| N | `<Tab>` / `<S-Tab>` | Next / previous buffer |
| N | `<leader>0`–`<leader>5` | Jump to buffer 0 (last) through 5 |
| N | `<leader>p` | Previous buffer |
| N | `<leader>b` / `<leader>B` | Jump-list back / forward |
| N | `<leader>bP` / `<leader>be` / `<leader>bj` / `<leader>bl` / `<leader>bp` / `<leader>br` | Delete non-pinned buffers / buffer explorer / pick buffer / delete left / toggle pin / delete right |
| N | `<leader>q` | Close the current buffer and return to the previous one |
| N | `<leader>w` / `<leader>a` / `<leader>x` | Save / save all and quit / save and quit |
| N | `<leader>tn` / `<leader>tc` / `<leader>ta` | New tab / close tab / close other tabs |
| N | `<leader><leader>` | Find files at the project root, or in the current Neo-tree folder |
| N | `<leader>e` | Toggle Neo-tree at the current working directory |
| N | `<leader><Tab>` / `<M-Tab>` | Toggle focus between Neo-tree and the editor |
| N | `<leader>nv` | Open `init.lua` in a vertical split |
| N | `<leader>o` / `<leader>O` | Insert a blank line below / above without entering Insert mode |
| N | `<leader>C` | Select the whole buffer |
| N | `<leader>tT` | Open a terminal in a new tab |
| N | `<leader>rt` | Open the current working directory in iTerm |

### Find, search, Git, and interface

| Mode | Keymap | Description |
|---|---|---|
| N | `<leader>,` | Switch buffer |
| N | `<leader>.` / `<leader>S` | Toggle / select a Scratch buffer |
| N | `<leader>:` | Command history |
| N | `<leader>fb` / `<leader>fB` | Buffers / all buffers |
| N | `<leader>fc` | Find a configuration file |
| N | `<leader>fe` / `<leader>fE` / `<leader>E` | Open Neo-tree at root / cwd / cwd |
| N | `<leader>ff` / `<leader>fF` | Find files at project root / cwd |
| N | `<leader>fg` | Find Git files |
| N | `<leader>fr` / `<leader>fR` | Recent files / recent files in cwd |
| N | `<leader>gc` / `<leader>gd` / `<leader>ge` / `<leader>gl` / `<leader>gs` / `<leader>gS` | Git commits / diff files / explorer / commits / status / stash |
| N | `<leader>pp` | Command palette |
| N | `<leader>r` | Prompt for a string to grep in the current working directory |
| N | `<leader>rw` | Replace the word under the cursor throughout the buffer |
| N | `<leader>uC` | Preview and choose a colorscheme |
| N | `<leader>um` | Toggle rendered Markdown |
| N | `<leader>n` / `<leader>un` | Notification history / dismiss notifications |
| N | `<leader>dps` | Profiler scratch buffer |
| N | `<leader>?` | Show buffer-local mappings with which-key |

### Search prefix

| Mode | Keymap | Description |
|---|---|---|
| N | `<leader>s"` | Registers |
| N | `<leader>s/` / `<leader>sr` | Search history / search and replace |
| N | `<leader>sa` / `<leader>sc` / `<leader>sC` | Autocommands / command history / commands |
| N | `<leader>sb` | Fuzzy-find current buffer lines |
| N | `<leader>sd` / `<leader>sD` | Diagnostics / buffer diagnostics |
| N | `<leader>sg` / `<leader>sG` | Grep at project root / cwd |
| N | `<leader>sh` / `<leader>sH` | Help pages / highlight groups |
| N | `<leader>sj` / `<leader>sk` / `<leader>sl` | Jump list / keymaps / location list |
| N | `<leader>sm` / `<leader>sM` | Marks / man pages |
| N | `<leader>sn`, `<leader>sna`, `<leader>snd`, `<leader>snh`, `<leader>snl`, `<leader>snt` | Noice menu, all messages, dismiss, history, last message, picker |
| N | `<leader>so` / `<leader>sq` / `<leader>sR` | Options / quickfix list / resume the last picker |
| N | `<leader>ss` / `<leader>sS` | Document symbols / workspace symbols |
| N | `<leader>st` / `<leader>sT` | TODOs / TODO-FIX-FIXME search |
| N | `<leader>sw` / `<leader>sW` | Word under cursor at project root / cwd |
| V | `<leader>sw` / `<leader>sW` | Selection at project root / cwd |

### Code, diagnostics, sessions, and Trouble

| Mode | Keymap | Description |
|---|---|---|
| N | `<leader>/` | Toggle comment |
| V | `<leader>/` | Toggle comment for the selection |
| N | `<leader>cF` | Format injected language regions |
| N | `<leader>cS` / `<leader>cl` / `<leader>cs` | Trouble LSP references, LSP list, symbols |
| N | `<leader>cm` | Mason |
| N | `<leader>qS` / `<leader>qd` / `<leader>ql` / `<leader>qs` | Select session / do not save / restore last / restore session |
| N | `<leader>xx` / `<leader>xX` | Trouble diagnostics / buffer diagnostics |
| N | `<leader>xL` / `<leader>xQ` | Trouble location list / quickfix list |
| N | `<leader>xt` / `<leader>xT` | Trouble TODOs / TODO-FIX-FIXME |

### Conditional plugin mappings

| Context | Mode | Keymap | Description |
|---|---|---|---|
| Aerial loaded | N | `<leader>ao` | Toggle the outline |
| LSP attached | N | `]r` / `[r` | Next / previous LSP reference |
| TypeScript `vtsls` attached | N | `gD` / `gR` | Source definition / file references |
| TypeScript `vtsls` attached | N | `<leader>co` / `<leader>cM` / `<leader>cu` / `<leader>cD` | Organize imports / add missing imports / remove unused imports / fix all |
| TypeScript `vtsls` attached | N | `<leader>cV` / `<leader>cF` | Select TypeScript version / format with TypeScript |
| Zig buffer | N | `<leader>zf` / `<leader>zb` / `<leader>zt` / `<leader>zr` | Format / build file / test file / run file |
| Telescope prompt | I | `<C-t>` / `<A-t>` | Send results to Trouble |
| Telescope prompt | I | `<A-i>` / `<A-h>` | Find files ignoring `.gitignore` / include hidden files |
| Telescope prompt | I | `<C-Down>` / `<C-Up>` | Next / previous prompt history item |
| Telescope prompt | N | `q` | Close the picker |
| Normal mode | N | `<M-h>` | Move the current line left |
| Visual selection | V | `<M-h>` / `<M-j>` / `<M-k>` / `<M-l>` | Move the selection left / down / up / right |

### Neo-tree buffer mappings configured here

| Context | Keymap | Description |
|---|---|---|
| Filesystem | `<BS>` / `.` / `H` | Parent directory / set root / toggle hidden files |
| Filesystem | `/` / `D` / `#` / `<C-x>` | Fuzzy find / find directory / fuzzy sort / clear filter |
| Filesystem | `[g` / `]g` | Previous / next Git-modified item |
| Filesystem | `h` / `l` / `<Tab>` | Collapse or parent / expand or first child / toggle node |
| Filesystem | `o`, `oc`, `od`, `og`, `om`, `on`, `os`, `ot` | Order menu / created / diagnostics / Git status / modified / name / size / type |
| Filesystem fuzzy finder | `<Down>` / `<C-n>` / `<Up>` / `<C-p>` / `<Esc>` | Cursor down / up / close |
| Buffers | `d` / `bd` | Delete buffer |
| Buffers | `<BS>` / `.` | Parent directory / set root |
| Buffers | `o`, `oc`, `od`, `om`, `on`, `os`, `ot` | Order menu / created / diagnostics / modified / name / size / type |
| Git status | `A`, `ga`, `gu`, `gU`, `gr`, `gc`, `gp`, `gg` | Add all / add / unstage / undo commit / revert / commit / push / commit and push |
| Git status | `o`, `oc`, `od`, `om`, `on`, `os`, `ot` | Order menu / created / diagnostics / modified / name / size / type |

Legacy `wk.register` entries in `lua/user/keymaps.lua` are not active with the current which-key version, so they are intentionally not presented as usable mappings above.

## 📂 Directory Structure

- `init.lua`: The main entry point of the configuration.
- `lua/community.lua`: Community plugins.
- `lua/lazy_setup.lua`: The setup for the lazy.nvim plugin manager.
- `lua/config/options.lua`: Neovim options.
- `lua/plugins/`: Plugin configurations.
- `lua/user/keymaps.lua`: Custom keymaps.

## 🆕 Recent Changes

- Added `zig.vim` plugin configuration for LazyVim at `lua/plugins/zig.lua` (loads for `*.zig` and `*.zon` files).
- Configured Zig formatting and convenience keymaps (`<leader>zf`, `<leader>zb`, `<leader>zt`, `<leader>zr`).
- Added `zls` (Zig Language Server) to `mason.nvim` ensure list via plugin config.
- Enabled formatting configuration with `stevearc/conform.nvim` and added `format_on_save` options in `lua/plugins/lsp.lua` (adjust `async`/`timeout_ms` there to change behavior).

To apply plugin changes run:

```bash
:Lazy sync
```

Or restart Neovim and run `:Lazy sync` from within Neovim.
