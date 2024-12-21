require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'tsx',
    'c',
    'lua',
    'vim',
    'typescript',
    'javascript',
    'html',
    'css',
    'json',
    'graphql',
    'rust',
    'prisma',
    'regex',
    'markdown',
    'markdown_inline',
  },

  sync_install = false,

  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
})

require('template-string').setup({})
