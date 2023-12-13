return {
  -- https://github.com/Shatur/neovim-ayu
  -- https://github.com/folke/tokyonight.nvim
  "Shatur/neovim-ayu",  -- "Shatur/neovim-ayu", "folke/tokyonight.nvim",  --"wuelnerdotexe/vim-enfocado", "catppuccin/nvim", "ellisonleao/gruvbox.nvim", "Mofiqul/dracula.nvim"
  lazy = false,  -- Pregunta si se tiene que cargar apenas inicia o no, True lo carga cuando se necesita
  priority = 1000,  -- Entre más alto sea el número más prioridad va a tener
  config = function()
    vim.cmd([[colorscheme ayu-dark]])  -- enfocado, tokyonight-night, ayu-dark, catppuccin, gruvbox, dracula
  end,
}
