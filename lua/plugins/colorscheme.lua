return {
    -- https://github.com/Shatur/neovim-ayu
    -- https://github.com/folke/tokyonight.nvim
    -- https://github.com/Mofiqul/dracula.nvim
    -- https://github.com/catppuccin/nvim
    "Shatur/neovim-ayu",
    "Mofiqul/dracula.nvim",
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
    "olimorris/onedarkpro.nvim",

    lazy = false, -- Pregunta si se tiene que cargar apenas inicia o no, True lo carga cuando se necesita
    priority = 1000, -- Entre más alto sea el número más prioridad va a tener
    config = function()
        vim.cmd([[colorscheme tokyonight-night]]) -- enfocado, catppuccin, ayu-dark, ayu-dark, gruvbox, dracula
    end,
}
