return {
  "EdenEast/nightfox.nvim",
  lazy = false,  -- load immediately
  priority = 1000, -- make sure it loads before other plugins that depend on colors
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        terminal_colors = true,
        dim_inactive = false,
        module_default = true,
        inverse = {
          match_paren = false,
          visual = false,
          search = false,
        },
        styles = {
          comments = "NONE",
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
      },
    })

    -- Load the colorscheme
    vim.cmd("colorscheme carbonfox")
  end,
}

