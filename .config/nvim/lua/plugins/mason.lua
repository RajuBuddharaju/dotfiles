return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "clangd",
        "intelephense",
        "html",
        "jdtls",
        "bash-language-server",
      },
      automatic_installation = true,
    }
  },
}
