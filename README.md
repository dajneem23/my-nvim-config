# My AstroNvim Configuration

This is my personal AstroNvim configuration.

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

- **[AstroNvim](https://github.com/AstroNvim/AstroNvim):** A beautiful and feature-rich neovim configuration.
- **[aerial.nvim](https://github.com/stevearc/aerial.nvim):** A code outline window for skimming and quick navigation.
- **[catppuccin](https://github.com/catppuccin/nvim):** A soothing pastel theme for the high-spirited programmer.
- **[copilot.vim](https://github.com/github/copilot.vim):** GitHub Copilot for Neovim.
- **[error-lens.nvim](https://github.com/yamatsum/error-lens.nvim):** A plugin that highlights diagnostics inline.
- **[heirline.nvim](https://github.com/rebelot/heirline.nvim):** A statusline plugin for Neovim.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim):** A blazing fast and easy to configure statusline for Neovim.
- **[mason.nvim](https://github.com/williamboman/mason.nvim):** Portable package manager for Neovim that runs everywhere Neovim runs.
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim):** A file explorer for Neovim.
- **[noice.nvim](https://github.com/folke/noice.nvim):** Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp):** A completion plugin for neovim coded in Lua.
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** A collection of configurations for the built-in LSP client.
- **[nvim-notify](https://github.com/rcarriga/nvim-notify):** A fancy, configurable, notification manager for Neovim.
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Treesitter configurations and abstraction layer for Neovim.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):** A highly extendable fuzzy finder over lists.
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim):** A clean, dark Neovim theme written in Lua.
- **[trouble.nvim](https://github.com/folke/trouble.nvim):** A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- **[which-key.nvim](https://github.com/folke/which-key.nvim):** A popup for keybindings.

## ⌨️ Keymaps

Here are some of the custom keymaps:

### General

| Keymap | Description |
|---|---|
| `jj` | Escape insert mode |
| `<leader>w` | Save the current file |
| `<leader>x` | Save and quit |
| `<leader>q` | Close the current buffer |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>tn` | New tab |
| `<leader>tc` | Close tab |
| `<leader>o` | Insert a new line below without entering insert mode |
| `<leader>O` | Insert a new line above without entering insert mode |
| `<C-l>` | Clear search highlight |
| `<M-Left>` | Go to the beginning of the line (Normal, Visual, and Insert modes) |
| `<M-Right>` | Go to the end of the line (Normal, Visual, and Insert modes) |

### Telescope

| Keymap | Description |
|---|---|
| `<leader>r` | Grep for a string in the current working directory |
| `gr` | Find LSP references |
| `<leader>pp` | Open the command palette |
| `ff` | Grep for the word under the cursor |

### Window Management

| Keymap | Description |
|---|---|
| `<leader>ws` | Split window horizontally |
| `<leader>wv` | Split window vertically |
| `<leader>wh` | Move to the left window |
| `<leader>wj` | Move to the bottom window |
| `<leader>wk` | Move to the top window |
| `<leader>wl` | Move to the right window |
| `<leader>wc` | Close the current window |

### Trouble

| Keymap | Description |
|---|---|
| `<leader>td` | Toggle document symbols |
| `<leader>tr` | Toggle LSP references |
| `<leader>tx` | Toggle diagnostics |

### LSP

| Keymap | Description |
|---|---|
| `<leader>zr` | Rename symbol |
| `<leader>za` | Code action |
| `<leader>zf` | Format |
| `<leader>zs` | Document symbols |
| `<leader>zS` | Workspace symbols |

## 📂 Directory Structure

- `init.lua`: The main entry point of the configuration.
- `lua/community.lua`: Community plugins.
- `lua/lazy_setup.lua`: The setup for the lazy.nvim plugin manager.
- `lua/polish.lua`: Custom modifications and tweaks.
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
