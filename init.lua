local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim plugins
require('lazy').setup({
  'rebelot/kanagawa.nvim',
  'simrat39/rust-tools.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        '~/workspace/*',
        '~/.config/*',
      },
      picker = {
        type = 'telescope', -- or "fzf-lua"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      -- optional picker
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      -- optional picker
      { 'ibhagwan/fzf-lua' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  'gcmt/wildfire.vim',
  { 'echasnovski/mini.indentscope', version = '*' },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  'axelvc/template-string.nvim',
  'windwp/nvim-ts-autotag',
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  'mfussenegger/nvim-lint',
  'sainnhe/everforest',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'mg979/vim-visual-multi',
  'MattesGroeger/vim-bookmarks',
  'tom-anders/telescope-vim-bookmarks.nvim',
})

-- Safe require for modular configs
local modules = {
  'base',
  'keymap',
  'p-mason',
  'p-lsp',
  'lsp-lua',
  'p-conform',
  'p-tree',
  'p-telescope',
  'p-bookmark',
  'lsp-typescript',
  'p-lint',
  'p-cmp',
  'p-treesitter',
  'p-term',
  'p-indent',
  'p-project',
  'p-lualine',
  'color',
  'lsp-rust',
}
for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify(
      'Error loading module: ' .. module .. '\n\n' .. err,
      vim.log.levels.ERROR
    )
  end
end
