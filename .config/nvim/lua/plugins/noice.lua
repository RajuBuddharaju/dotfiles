return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true, -- Enables Noice cmdline UI
        view = "cmdline_popup", -- Uses floating popup for command line
      },
      messages = {
        enabled = true, -- Enables Noice messages UI
        view = "notify", -- Default view for messages
      },
      popupmenu = {
        enabled = true, -- Enables Noice popupmenu UI
      },
      notify = {
        enabled = true,
      },
      lsp = {
        progress = {
          enabled = true,
          throttle = 100, -- Updates LSP progress faster
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = false,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
        },
      },
      markdown = {
        hover = {
          ["|(%S-)|"] = vim.cmd.help,
        },
      },
      health = { checker = true },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })
  end,
}

