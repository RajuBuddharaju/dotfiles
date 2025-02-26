return {
  'akinsho/bufferline.nvim',
  enabled = true,
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup{
      options = {
        numbers = "none", -- No numbers on buffers
        close_command = "bdelete! %d", -- Close buffer command
        right_mouse_command = "bdelete! %d", -- Right-click buffer close
        left_mouse_command = "buffer %d", -- Click to switch
        middle_mouse_command = nil, -- Disable middle click close
        indicator = {
          style = 'none', -- More minimal look
        },
        offsets = {
          {
            filetype = "NvimTree", -- Adjust for sidebar
            text = "File Explorer", -- Sidebar title
            text_align = "center",
            separator = true,
          }
        },
        show_buffer_icons = true, -- Show file icons
        show_buffer_close_icons = false, -- Hide close icons for a cleaner look
        show_close_icon = false, -- Hide global close icon
        show_tab_indicators = true, -- Keep tab indicators
        separator_style = "thin", -- Sleek separators
        always_show_bufferline = true, -- Always show bufferline

        custom_filter = function(buf_number)
          -- Exclude floating terminal and windowless buffers from Bufferline
          local buf_type = vim.bo[buf_number].buftype
          if buf_type == "nofile" or buf_type == "terminal" then
            return false
          end
          return true
        end,

      }
    }
  end
}

