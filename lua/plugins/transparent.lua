return {
    "tribela/transparent.nvim",
    event = "VimEnter",
    config = function()
        require("transparent").setup({
            extra_groups = { -- Grupos adicionales para hacer transparentes
                "Normal", -- Fondo del editor
                "NormalNC", -- Fondo cuando la ventana no está enfocada
                "TelescopeNormal", -- Fondo de Telescope
                "TelescopeBorder", -- Borde de Telescope
                -- "WhichKeyFloat", -- Ventana flotante de WhichKey
                -- "NormalFloat", -- Ventanas flotantes en general
                "FloatBorder", -- Bordes de ventanas flotantes
                "NeoTreeNormal", -- Para NeoTree si lo usas en vez de NvimTree
            },
            exclude_groups = {}, -- Excluir elementos si es necesario
        })
    end,
}
