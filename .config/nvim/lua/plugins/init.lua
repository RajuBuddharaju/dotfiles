-- lua/plugins/init.lua
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

-- files we DON'T want to load globally
local exclude = {
  ["init"] = true,               -- always exclude self
  ["notes"] = true,              -- we'll import this separately in lazy.setup
  ["image"] = true,
  ["img-clip"] = true,
  ["mdmath"] = true,
  ["obsidian"] = true,
  ["render-markdown"] = true,
}

local plugins = {}
for _, file in ipairs(plugin_files) do
  local name = file:match(".*/(.*)%.lua$")
  if not exclude[name] then
    table.insert(plugins, require("plugins." .. name))
  end
end

return plugins

