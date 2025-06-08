return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim", -- still maintained under original repo
    opts = {
      ensure_installed = {
        "pyright",
        "lua_ls",
        "clangd",
        "intelephense",
        "html",
        "jdtls",
      },
      automatic_installation = true,
    }
  },
}
