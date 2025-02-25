vim.g.mapleader = " "
local map = vim.keymap.set

-- exiting terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Keybinding to toggle Floaterminal
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  -- If in terminal mode, escape first
  if vim.fn.mode() == "t" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc><esc>", true, false, true), 'n', false)
  end
  -- Now run the Floaterminal command
  vim.cmd("Floaterminal")
end, { noremap = true, silent = true })

-- yank to clipboard
map({"n","v"}, "<leader>y", [["+y]], { noremap = false, silent = true })

-- buffers
map("n", "<leader>bn", ":bn<CR>", { noremap = true, silent = true })  -- Next buffer
map("n", "<leader>bp", ":bp<CR>", { noremap = true, silent = true })  -- Previous buffer
map("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })  -- Delete buffer

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })  -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })   -- Grep
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })     -- Buffer list
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })   -- Help tags

-- File Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })  -- Toggle NvimTree
map("n", "<leader>o", ":NvimTreeFocus<CR>", { noremap = true, silent = true })   -- Focus NvimTree

-- -- Yazi Keybindings
-- map("n", "<leader>e", "<cmd>Yazi<CR>", { noremap = true, silent = true })  -- Open Yazi
-- map("n", "<leader>o", "<cmd>Yazi cwd<CR>", { noremap = true, silent = true }) -- Open Yazi in current working dir
-- map("n", "<c-up>", "<cmd>Yazi toggle<CR>", { noremap = true, silent = true }) -- Resume last Yazi session


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


