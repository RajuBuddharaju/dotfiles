return{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
}

