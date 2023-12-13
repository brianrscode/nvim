return {
  -- https://github.com/hrsh7th/nvim-cmp
  -- Es un motor que da la funcionalidad de autocompletado y usa otros repositorios para llenar el autocompletado
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",  -- Lee el contexto de los archivos (buffer) abiertos y lo da como fuente
    "hrsh7th/cmp-path",  -- Saber sobre el filesystem donde estamos
    "hrsh7th/cmp-nvim-lsp", -- Da la conexión al servidor de LSP
    "hrsh7th/cmp-cmdline",  -- Da sugerencias de en la barra de comandos
    "hrsh7th/cmp-git",  -- Da autocompletado de git
    "L3MON4D3/LuaSnip",  -- Es un motor para snipets de lua
    "saadparwaiz1/cmp_luasnip",  -- fuente en ralación de lua snip
    "windwp/nvim-autopairs",  -- cierra llaves automáticamente
  },
  opts = function ()
    return {
      snippet = {
        expand = function (args)
          require("luasnip").lsp_expand(args.boy)
        end,
      },
    }
  end,
  event = "VeryLazy",  -- Cuando cargue el editor se carga el autocompletado
  main = "config.plugins.cmp",  -- Como se llama el modulo a cargar...
  config = true,  -- para que lo llame

  -- Las configuraciones están en "lua/config/plugins/cmp.lua"
}
