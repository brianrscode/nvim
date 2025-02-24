return {
    -- https://github.com/Shatur/neovim-ayu
    -- https://github.com/folke/tokyonight.nvim
    -- https://github.com/Mofiqul/dracula.nvim
    -- https://github.com/catppuccin/nvim
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd([[colorscheme catppuccin-mocha]]) -- enfocado, catppuccin, ayu-dark, ayu-dark, gruvbox, dracula
        end,
    },
    { "Shatur/neovim-ayu", priority = 1001 },
    { "folke/tokyonight.nvim", priority = 1003 },

    lazy = false, -- Pregunta si se tiene que cargar apenas inicia o no, True lo carga cuando se necesita
    priority = 1000, -- Entre más alto sea el número más prioridad va a tener
}
