return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { -- main one
      "folke/neoconf.nvim",
      {
        "ms-jpq/coq_nvim",
        branch = "coq",
      }, -- 9000+ Snippets
      {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
      }, -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
      -- Need to **configure separately**
      {
        "ms-jpq/coq.thirdparty",
        branch = "3p",
      }, -- - shell repl
      -- - nvim lua api
      -- - scientific calculator
      -- - comment banner
      -- - etc
    },
    opts = {
        diagnostics = {
            virtual_text = {
                prefix = "icons"
            }
        },
        capabilities = {
            workspace = {
                didChangeWatchedFiles = {
                    dynamicRegistration = false
                }
            }
        },
        servers = {
            -- lua_ls = {
            --     -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
            --     -- single_file_support = true,
            --     settings = {
            --         Lua = {
            --             misc = {
            --                 -- parameters = { "--loglevel=trace" },
            --             },
            --             hover = {
            --                 expandAlias = false
            --             },
            --             type = {
            --                 castNumberToInteger = true,
            --                 inferParamType = true
            --             },
            --             diagnostics = {
            --                 disable = {"incomplete-signature-doc", "trailing-space"},
            --                 -- enable = false,
            --                 groupSeverity = {
            --                     strong = "Warning",
            --                     strict = "Warning"
            --                 },
            --                 groupFileStatus = {
            --                     ["ambiguity"] = "Opened",
            --                     ["await"] = "Opened",
            --                     ["codestyle"] = "None",
            --                     ["duplicate"] = "Opened",
            --                     ["global"] = "Opened",
            --                     ["luadoc"] = "Opened",
            --                     ["redefined"] = "Opened",
            --                     ["strict"] = "Opened",
            --                     ["strong"] = "Opened",
            --                     ["type-check"] = "Opened",
            --                     ["unbalanced"] = "Opened",
            --                     ["unused"] = "Opened"
            --                 },
            --                 unusedLocalExclude = {"_*"}
            --             }
            --         }
            --     }
            -- },
            rust_analyzer = {},
            -- ts_ls = {
            --     -- single_file_support = true,
            --     settings = {
            --         tsserver = {
            --             fileOperations = {
            --                 watchOptions = {
            --                     watchFile = "useFsEvents",
            --                     watchDirectory = "useFsEvents"
            --                 }
            --             }
            --         }
            --     }
            -- },
            eslint = {
                filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
                settings = {
                    format_on_save = false,
                    format = false, -- disable formatting by eslint
                    codeAction = true,
                    lintTask = true
                },
                init_options = {
                    provideFormatter = false
                }
            },
            solidity_ls = {}
        }
    },
    config = function() -- for help on nvim options go to :h vim.lsp.buf
        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")


        lspconfig.rust_analyzer.setup({
            -- TODO: fix cmp_nvim_lsp
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            settings = {
                ["rust-analyzer"] = {
                    -- Other Settings ...
                    procMacro = {
                        ignored = {
                            leptos_macro = { -- optional: --
                            -- "component",
                            "server"}
                        }
                    }
                }
            }
        })
    end
}, {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
        formatters_by_ft = {
            ["javascript"] = {"dprint", "prettier"},
            ["javascriptreact"] = {"dprint"},
            ["typescript"] = {"dprint", "prettier"},
            ["typescriptreact"] = {"dprint"}
        },
        formatters = {
            dprint = {
                condition = function(_, ctx)
                    return vim.fs.find({"dprint.json"}, {
                        path = ctx.filename,
                        upward = true
                    })[1]
                end
            }
        }
    }
} -- {
--     "mfussenegger/nvim-lint",
--     opts = {
--         linters_by_ft = {
--             lua = {"selene", "luacheck"}
--         },
--         linters = {
--             selene = {
--                 condition = function(ctx)
--                     local root = LazyVim.root.get({
--                         normalize = true
--                     })
--                     if root ~= vim.uv.cwd() then
--                         return false
--                     end
--                     return vim.fs.find({"selene.toml"}, {
--                         path = root,
--                         upward = true
--                     })[1]
--                 end
--             },
--             luacheck = {
--                 condition = function(ctx)
--                     local root = LazyVim.root.get({
--                         normalize = true
--                     })
--                     if root ~= vim.uv.cwd() then
--                         return false
--                     end
--                     return vim.fs.find({".luacheckrc"}, {
--                         path = root,
--                         upward = true
--                     })[1]
--                 end
--             }
--         }
--     }
-- }
}
