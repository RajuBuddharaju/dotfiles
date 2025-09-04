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
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Ensure cmp-nvim-lsp is required first

      -- Python LSP
      lspconfig.pyright.setup {
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

      -- Java LSP
      lspconfig.jdtls.setup{}

      -- PHP LSP
      lspconfig.intelephense.setup {
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("package.json", ".git", "index.php")(fname) or vim.fn.getcwd()  -- Fallback to current directory if no project is found
        end,

        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter", "gd", "hash",
              "json", "mbstring", "openssl", "pcre", "PDO", "session", "SPL", "standard", "xml",
              "zip", "zlib"
            },
            files = {
              maxSize = 5000000, -- Set max file size (5MB)
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      }

      -- HTML LSP
      lspconfig.html.setup {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "htm", "twig", "php" },
        settings = {
          html = {
            format = {
              wrapLineLength = 120,
              unformatted = "pre,code,textarea",
            },
            hover = {
              documentation = true,
              references = true,
            },
          },
        },
      }

      -- Dart LSP
      lspconfig.dartls.setup {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_dir = require('lspconfig.util').root_pattern("pubspec.yaml"),
      }


      -- Assigning capabilities for all LSPs.
      local servers = { "pyright", "lua_ls", "clangd", "intelephense", "html", "jdtls", "dartls" }

      for _, name in ipairs(servers) do
        lspconfig[name].setup({
          capabilities = capabilities,
        })
      end

    end,
  }
}

