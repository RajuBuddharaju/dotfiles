-- lua/plugins/notes.lua

-- Add one or more roots where these plugins should load
local note_roots = {
  vim.fn.expand("~/Documents/notes-global"),
  -- vim.fn.expand("~/notes2"), -- for more note directories
}

local function in_notes()
  local uv = vim.uv or vim.loop
  local cwd = uv.cwd() or ""
  if cwd == "" then return false end

  -- normalize both sides and allow subdirectories
  cwd = vim.fs.normalize(cwd)
  for _, root in ipairs(note_roots) do
    root = vim.fs.normalize(root)
    if cwd == root or cwd:sub(1, #root + 1) == (root .. "/") then
      return true
    end
  end
  return false
end

local function only_in_notes(spec)
  spec.cond = in_notes -- (or spec.enabled = in_notes)
  return spec
end

return {
  only_in_notes(require("plugins.image")),
  only_in_notes(require("plugins.img-clip")),
  only_in_notes(require("plugins.mdmath")),
  only_in_notes(require("plugins.render-markdown")),
}

