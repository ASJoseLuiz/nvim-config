local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Reconhece 'vim' como uma global
      },
      workspace = {
        library = {
          vim.fn.stdpath('config'), -- Configurações do Neovim
          vim.fn.stdpath('data'), -- Dados do Neovim
          vim.env.VIMRUNTIME, -- Runtime do Neovim
          vim.fn.expand('$VIMRUNTIME/lua'), -- Biblioteca padrão do Neovim
        },
        checkThirdParty = false, -- Evita alertas sobre bibliotecas de terceiros
      },
      telemetry = {
        enable = false, -- Desativa telemetria
      },
    },
  },
})
