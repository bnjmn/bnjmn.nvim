return {
  {
    'linux-cultist/venv-selector.nvim',
    branch = 'regexp',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    config = function()
      require('venv-selector').setup {
        settings = {
          search = {
            find_slash_tmp = {
              command = 'fd python$ ~/.venvs --full-path',
            },
          },
        },
        -- pipenv_path = '~/.local/share/virtualenvs',
        -- pyenv_path = '~/.pyenv/versions',
      }
    end,
    opts = {
      -- Your options gobbere
      -- name = "venv",
      -- auto_refresh = false
      -- dubug = true,
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
}
