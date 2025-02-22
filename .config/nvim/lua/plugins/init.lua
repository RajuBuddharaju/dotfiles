local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

local plugins = {}
for _, file in ipairs(plugin_files) do
  local name = file:match(".*/(.*)%.lua$")
  if name ~= "init" then
    table.insert(plugins, require("plugins." .. name))
  end
end

return plugins
