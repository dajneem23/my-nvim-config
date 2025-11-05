return {
  {
    "ziglang/zig.vim",
    ft = { "zig", "zon" }, -- Load only for Zig files (.zig and .zon)
    config = function()
      -- Zig formatting configuration
      vim.g.zig_fmt_autosave = 1 -- Auto format on save
      vim.g.zig_fmt_parse_errors = 1 -- Parse format errors
      vim.g.zig_fmt_max_window_height = 5 -- Max height for error window
      
      -- Set up Zig-specific keymaps only for Zig files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "zig",
        callback = function()
          local opts = { buffer = true, noremap = true, silent = true }
          
          -- Format current file
          vim.keymap.set("n", "<leader>zf", ":call zig#fmt#Format()<CR>", 
            vim.tbl_extend("force", opts, { desc = "Format Zig file" }))
          
          -- Build current file
          vim.keymap.set("n", "<leader>zb", ":compiler zig_build_exe | make<CR>", 
            vim.tbl_extend("force", opts, { desc = "Build Zig file" }))
          
          -- Test current file
          vim.keymap.set("n", "<leader>zt", ":compiler zig_test | make<CR>", 
            vim.tbl_extend("force", opts, { desc = "Test Zig file" }))
          
          -- Run current file
          vim.keymap.set("n", "<leader>zr", ":!zig run %<CR>", 
            vim.tbl_extend("force", opts, { desc = "Run Zig file" }))
        end,
      })
    end,
  },
  
  -- Optional: Add Zig LSP support through mason.nvim
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zls" }) -- Zig Language Server
    end,
  },

  -- Configure nvim-lspconfig for Zig Language Server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          settings = {
            zls = {
              enable_snippets = true,
              enable_argument_placeholders = true,
              enable_build_on_save = true,
              enable_autofix = false,
              semantic_tokens = "full",
            },
          },
        },
      },
    },
  },

  -- Add Zig syntax highlighting to Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zig" })
    end,
  },
}