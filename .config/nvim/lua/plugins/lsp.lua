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
      -- nvim-cmp capabilities once, for all servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities }) -- apply to every server

      -- If you still need utilities like root_pattern:
      local util = require("lspconfig.util")

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "error",
                reportOptionalMemberAccess = "error",
                reportOptionalSubscript = "error",
                reportPrivateImportUsage = "error",
                reportUnboundVariable = "error",
                reportUndefinedVariable = "error",
                reportInvalidTypeVarUse = "error",
              },
            },
          },
        },
      })

      -- Lua
      vim.lsp.config("lua_ls", {})

      -- C/C++
      vim.lsp.config("clangd", {})

      -- Java
      vim.lsp.config("jdtls", {})

      -- PHP
      vim.lsp.config("intelephense", {
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php" },
        root_dir = function(fname)
          return util.root_pattern("package.json", ".git", "index.php")(fname) or vim.fn.getcwd()
        end,
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter", "gd", "hash",
              "json", "mbstring", "openssl", "pcre", "PDO", "session", "SPL", "standard", "xml",
              "zip", "zlib"
            },
            files = { maxSize = 5000000 },
            diagnostics = { enable = true },
          },
        },
      })

      -- HTML
      vim.lsp.config("html", {
        cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "htm", "twig", "php" },
        settings = {
          html = {
            format = { wrapLineLength = 120, unformatted = "pre,code,textarea" },
            hover = { documentation = true, references = true },
          },
        },
      })

      -- Dart
      vim.lsp.config("dartls", {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        filetypes = { "dart" },
        root_dir = util.root_pattern("pubspec.yaml"),
      })

      -- finally, enable them
      for _, name in ipairs({ "pyright", "lua_ls", "clangd", "jdtls", "intelephense", "html", "dartls" }) do
        vim.lsp.enable(name)
      end
    end,
  }
}
