
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = function(path, bufnr)
      vim.bo[bufnr].filetype = "php"
    end,
  }
})



