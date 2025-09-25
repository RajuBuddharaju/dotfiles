vim.g.mapleader = " "
local map = vim.keymap.set

-- yank to clipboard
map({"n","v"}, "<leader>y", [["+y]], { noremap = false, silent = true })

-- buffers
-- map("n", "<leader>bn", ":bn<CR>", { noremap = true, silent = true })  -- Next buffer
-- map("n", "<leader>bp", ":bp<CR>", { noremap = true, silent = true })  -- Previous buffer
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })  -- Delete buffer

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })   -- Grep
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })     -- Buffer list
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })   -- Help tags

-- File Manager
map("n", "<leader>o", "<cmd>Oil<CR>",{ noremap = true, silent = true })  -- Toggle NvimTree

-- Git Signs
map("n", "]c", function()  -- Jump to next hunk
  require("gitsigns").next_hunk()
end, { noremap = true, silent = true })

map("n", "[c", function()  -- Jump to previous hunk
  require("gitsigns").prev_hunk()
end, { noremap = true, silent = true })

map("n", "<leader>hp", function()  -- Preview hunk
  require("gitsigns").preview_hunk()
end, { noremap = true, silent = true })

map("n", "<leader>hs", function()  -- Stage hunk
  require("gitsigns").stage_hunk()
end, { noremap = true, silent = true })

-- Keymap to show diagnostics without using mouse
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Formatting with one key.
vim.keymap.set("n", "<leader>i", function()
  vim.lsp.buf.format({ async = true }) -- Uses LSP formatting if available
end, { desc = "Format buffer" })

-- Dismiss Noice Message
vim.keymap.set("n", "<leader>nd", "<Cmd>NoiceDismiss<CR>", { noremap = true, silent = true})


