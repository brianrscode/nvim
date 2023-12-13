return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  -- Es un explorador de archivos. Muestra el directorio actual en forma de árbol
  -- y perite operaciones sobre los archivos
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
