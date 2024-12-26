return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      numhl = true,
      watch_gitdir = {
        interval = 1000,
      },
      current_line_blame = false,
      sign_priority = 6,
      status_formatter = nil,
    })

    -- Manually define highlights (new way)
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#98c379', bg = 'NONE' })  -- Green for additions
    vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#e5c07b', bg = 'NONE' })  -- Yellow for changes
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#e06c75', bg = 'NONE' })  -- Red for deletions
    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { fg = '#c678dd', bg = 'NONE' })  -- Purple for modified deletions
    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { fg = '#e06c75', bg = 'NONE' })  -- Same as delete
  end
}

