vim.opt.nu = true             -- enable line numbers
vim.opt.relativenumber = true -- relative line numbers

vim.opt.encoding = "utf-8"    -- set encoding

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.list = true       -- show tab characters and trailing whitespace

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- unless capital letter in search
vim.opt.hlsearch = false  -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true  -- incrementally highlight searches as you type

vim.opt.scrolloff = 8     -- minimum number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 --minimum number of columns to keep above and below the cursor

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
}) -- javascript formatting

vim.api.nvim_create_autocmd("FileType", {  -- TODO: Indenting for php embedded inside html is not good.
  pattern = { "*.php", "*.html", "*.blade" },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.autoindent = true   -- Keep basic indentation
    vim.opt.smartindent = false -- Disable Neovim's auto-indent (fixes Enter issue)
    vim.opt.cindent = false     -- Disable C-style indentation (not needed for PHP)
    vim.opt.indentexpr = ""     -- Prevent Neovim from overriding PHP indentation
  end
})


vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
}) -- return to last edit position when opening files

-- Enable true colors (for better theme and bufferline support)
vim.opt.termguicolors = true

-- Treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.fillchars:append({ eob = ' ' })
