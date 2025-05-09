return {
    -- https://github.com/norcalli/nvim-colorizer.lua
    -- ¡Resaltador de color de alto rendimiento!
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
}
