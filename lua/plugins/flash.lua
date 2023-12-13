return {
  -- https://github.com/folke/flash.nvim
  -- Permite navegar entre el código con etiquetas de búsqueda
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  --@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  },
}
