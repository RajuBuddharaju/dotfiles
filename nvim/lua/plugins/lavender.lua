return{
  url = "https://codeberg.org/jthvai/lavender.nvim",
  branch = "stable", -- versioned tags + docs updates from main
  lazy = false,
  priority = 1000,
  config = function()
    -- Default config in lua
    vim.g.lavender = {
      transparent = {
        background = true, -- do not render the main background
        float      = true, -- do not render the background in floating windows
        popup      = true, -- do not render the background in popup menus
        sidebar    = true, -- do not render the background in sidebars
      },
      contrast = true, -- colour the sidebar and floating windows differently to the main background

      italic = {
        comments  = false, -- italic comments
        functions = false, -- italic function names
        keywords  = false, -- italic keywords
        variables = false, -- italic variables
      },

      signs = false, -- use icon (patched font) diagnostic sign text

      -- new values will be merged in
      overrides = {
        -- highlight groups - see theme.lua
        -- existing groups will be entirely replaced
        theme = {},

        colors = {
          cterm = {}, -- cterm colours - see colors/cterm.lua
          hex = {}, -- hex (true) colours - see colors/hex.lua
        },
      },
    }

    vim.cmd.colorscheme("lavender")
  end
}
