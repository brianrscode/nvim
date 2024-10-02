return {
  -- https://github.com/lewis6991/gitsigns.nvim
  "lewis6991/gitsigns.nvim",  -- Este plugin nos marca los cambios que ocurren en el archivo (complementa a git)
  opts = {
    numhl = true,  -- muestra de color el número de la línea que se editó
    max_file_length = 10000,  -- si el archivo es de esa cantidad de líneas o más no lo abre
  }
}
