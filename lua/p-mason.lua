require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
  log_level = vim.log.levels.DEBUG,
  max_concurrent_installers = 4,
})

require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    { 'golangci-lint', version = 'v1.47.0' },
    { 'bash-language-server', auto_update = true },
    'lua-language-server',
    'vim-language-server',
    'rust-analyzer',
    'gopls',
    'stylua',
    'eslint_d',
    'prettierd',
    'shellcheck',
    'editorconfig-checker',
    'gofumpt',
    'golines',
    'gomodifytags',
    'gotests',
    'impl',
    'json-to-struct',
    'luacheck',
    'misspell',
    'revive',
    'shfmt',
    'staticcheck',
    'vint',
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 5,
})

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('mason-tool-installer').check_install()
  end,
})
