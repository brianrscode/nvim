return {
  -- https://github.com/nvim-lualine/lualine.nvim
  -- Muestra la barra inferior que da información
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",  -- Cuando cargue el editor se carga lualine
  opts = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
