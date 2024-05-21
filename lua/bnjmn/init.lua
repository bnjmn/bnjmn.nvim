-- Load all lua files in relative dir automatically

local function log(msg, level)
  level = level or 'INFO'
  local levels = { DEBUG = 1, INFO = 2, WARN = 3, ERROR = 4 }
  local log_level = os.getenv 'NVIM_LOG_LEVEL' or 'INFO'
  local current_level = levels[log_level] or levels.INFO

  if levels[level] >= current_level then
    vim.notify(msg, vim.log.levels[level])
  end
end

local function require_all_lua_files()
  local config_dir = vim.fn.stdpath 'config' .. '/lua/bnjmn/'
  local lua_files = vim.fn.readdir(config_dir, [[v:val =~ '\.lua$']])

  for _, file in ipairs(lua_files) do
    if file ~= 'init.lua' then
      local relative_module = 'bnjmn.' .. file:gsub('%.lua$', '')
      log('Requiring module: ' .. relative_module, 'DEBUG')
      require(relative_module)
    end
  end
end

require_all_lua_files()

vim.notify('bnjmn/init.lua loaded', vim.log.levels.INFO)
