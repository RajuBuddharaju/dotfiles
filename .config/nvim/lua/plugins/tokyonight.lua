return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",  -- Options: "storm", "night", "moon", "day"
      transparent = true,  -- Make sure terminal transparency works
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "dark",
        floats = "dark",
      },
    })
    vim.cmd.colorscheme("tokyonight")
  end
}

