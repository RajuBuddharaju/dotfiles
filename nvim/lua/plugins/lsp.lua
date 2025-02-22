return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig") -- Ensure lspconfig is required first

      -- Python LSP
      require("lspconfig").pyright.setup {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- Use "strict" if you want even more checks
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "error", -- Treat general type warnings as errors
                reportOptionalMemberAccess = "error", -- Prevent accessing properties on optional types
                reportOptionalSubscript = "error", -- Prevent indexing `None`
                reportPrivateImportUsage = "error", -- Disallow using private modules
                reportUnboundVariable = "error", -- Treat unbound variables as errors
                reportUndefinedVariable = "error", -- Undefined vars should be errors
                reportInvalidTypeVarUse = "error", -- Using TypeVar incorrectly
              },
            }
          }
        }
      }

      -- Lua LSP
      lspconfig.lua_ls.setup {}

      -- C++ LSP
      lspconfig.clangd.setup {}
    end,
  }
}

