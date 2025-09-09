-- if true then
--     return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional icons
    "folke/trouble.nvim", -- ensure trouble is loaded
  },
  opts = function(_, opts)
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c_normal", -- important for consistent color
    })

    -- Ensure sections table exists
    opts.sections = opts.sections or {}

    -- Provide a default lualine_c if missing
    opts.sections.lualine_c = opts.sections.lualine_c or {
      { "filename", path = 2 },
    }

    -- Append Trouble's symbol component to lualine_c
    table.insert(opts.sections.lualine_c, {
      symbols.get,
      cond = symbols.has,
    })
  end,
}