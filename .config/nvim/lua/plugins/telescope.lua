-- plugin spec (lazy.nvim or similar)
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      -- Make ripgrep include hidden files, but ignore .git
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob', '!**/.git/*',
        },
      },
      pickers = {
        -- Show hidden files in the file picker by default
        find_files = {
          hidden = true,
          -- Use ripgrep for listing files, include hidden, skip .git
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          follow = true,
        },
      },
    }
  end,
}

