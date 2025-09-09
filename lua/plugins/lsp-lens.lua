-- return {
--     'VidocqH/lsp-lens.nvim',
--     config = function()
--         require('lsp-lens').setup()
--     end,
--     event = "LspAttach",
--     dependencies = {
--         'nvim-treesitter/nvim-treesitter'
--     },
--     -- ft = { 'python', 'javascript', 'typescript', 'lua', 'go', 'rust' }
-- }

return {
  "jinzhongjia/LspUI.nvim",
  branch = "main",
  config = function()
    require("LspUI").setup({
	  -- config options go here
	  })
  end
}