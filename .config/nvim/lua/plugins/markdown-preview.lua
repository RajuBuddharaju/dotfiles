
return {
  "iamcco/markdown-preview.nvim",
  -- The npm install step happens here on initial install/update
  build = "cd app && npm i",
  -- Load this plugin only when editing Markdown files
  ft = "markdown",
  config = function()
    -- Optional settings
    -- Auto-start the preview when entering a markdown file
    vim.g.mkdp_auto_start = 1

    -- Specify a particular browser if needed (uncomment & adjust path)
    -- vim.g.mkdp_browser = "/usr/bin/firefox"
  end,
}
