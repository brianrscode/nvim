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
                integrations = {
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    -- Asegura que los bordes de ventanas flotantes tengan color
                    cmp = true,
                    lsp_trouble = true,
                    telescope = {
                        enabled = true,
                        style = "bordered",
                    },
                    which_key = true,
                },
                custom_highlights = function(colors)
                    return {
                        FloatBorder = { fg = colors.overlay1, bg = colors.base },
                        NormalFloat = { bg = colors.base },
                    }
                end,
            })

            -- vim.cmd([[colorscheme catppuccin-mocha]])
            -- vim.cmd([[colorscheme catppuccin-mocha]]) -- enfocado, catppuccin, ayu-dark, ayu-dark, gruvbox, dracula
        end,
    },
    { "Shatur/neovim-ayu", priority = 1001 },
    { "folke/tokyonight.nvim", priority = 1003 },
    { "lunarvim/horizon.nvim", priority = 1004 },

    lazy = false, -- Pregunta si se tiene que cargar apenas inicia o no, True lo carga cuando se necesita
    priority = 1000, -- Entre más alto sea el número más prioridad va a tener
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    },
}
