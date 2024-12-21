local builtin = require('telescope.builtin')
local keymap = vim.keymap

keymap.set(
  'n',
  '<leader>f',
  builtin.find_files,
  { desc = 'Telescope find files' }
)
keymap.set(
  'n',
  '<leader>g',
  builtin.live_grep,
  { desc = 'Telescope live grep' }
)

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['esc'] = actions.close,
      },
    },
  },
  file_ignore_pattern = {
    '.git',
    'lazy-lock.json',
    'node_modules',
    'yarn_lock',
    'schema.gql',
  },

  dynamic_preview_title = true,
  path_display = { 'smart' },
  pickers = {
    find_files = {
      hidden = true,
    },
  },

  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.5,
    },
  },
})
