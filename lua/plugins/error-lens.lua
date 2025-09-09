local SymbolKind = vim.lsp.protocol.SymbolKind



return{
  "chikko80/error-lens.nvim",
  event = "BufRead",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    -- your options go here, e.g.,
    -- enable = true,
    -- highlight_group = "ErrorLens",
  },
  init = function()
        require("error-lens").setup()
  end,
}