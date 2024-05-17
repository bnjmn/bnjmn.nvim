-- Toggle settings

local function vim_norm_opt_toggle(key, opt, on, off, desc)
  vim.keymap.set('n', key, function()
    local state = vim.opt[opt]:get() == off and on or off
    vim.opt[opt] = state
    local message = desc .. (state == on and ' Enabled' or ' Disabled')
    vim.notify(message)
  end, { desc = 'toggle ' .. desc })
end

vim_norm_opt_toggle('<leader>th', 'hlsearch', true, false, 'Highlight Search')
vim_norm_opt_toggle('<leader>tl', 'list', true, false, 'List Characters')
vim_norm_opt_toggle('<leader>tn', 'number', true, false, 'Line Numbers')
vim_norm_opt_toggle('<leader>tp', 'paste', true, false, 'Paste Mode')
vim_norm_opt_toggle('<leader>tw', 'wrap', true, false, 'Wrap')
vim_norm_opt_toggle('<leader>tsp', 'spell', true, false, 'Spell Checker')
