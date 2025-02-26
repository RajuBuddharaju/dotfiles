return {
  "nvim-tree/nvim-tree.lua",
  name = "NvimTree",
  enabled = true,
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true, -- Disable netrw for cleaner file navigation
      hijack_netrw = true, -- Replace netrw with NvimTree
      auto_reload_on_write = true, -- Auto refresh when files change
      hijack_cursor = true, -- Keep cursor inside NvimTree
      sync_root_with_cwd = true, -- Sync tree with the current working directory
      view = {
        width = 35, -- Adjust sidebar width
        side = "left", -- Sidebar on the left
        preserve_window_proportions = true, -- Keep window proportions when resizing
        signcolumn = "yes", -- Show signcolumn for git indicators
      },
      renderer = {
        indent_markers = {
          enable = true, -- Add tree structure guides
        },
        highlight_opened_files = "icon", -- Highlight opened files
        root_folder_label = false, -- Hide root folder label
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "", -- Custom folder arrow (minimalist)
              arrow_open = "",
            },
          },
        } ,
      },
      filters = {
        dotfiles = false, -- Hide dotfiles (change to true if you want them hidden)
        custom = { ".git", "node_modules", ".cache" }, -- Custom ignored files
      },
      git = {
        enable = true, -- Git status indicators
        ignore = false, -- Show ignored files
        timeout = 500, -- Git status delay
      },
      actions = {
        open_file = {
          quit_on_open = false, -- Keep NvimTree open when selecting a file
          resize_window = true, -- Resize window on open
        },
      },
    })
  end
}

