return {
  -- https://github.com/norcalli/nvim-colorizer.lua
  -- ¡Resaltador de color de alto rendimiento!
  -- Otras opciones para resaltador -> https://github.com/ziontee113/color-picker.nvim
  "norcalli/nvim-colorizer.lua",
  config = function ()
    require("colorizer").setup()
  end,
}
