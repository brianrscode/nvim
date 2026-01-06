return {
    -- https://github.com/Shatur/neovim-ayu
    -- https://github.com/folke/tokyonight.nvim
    -- https://github.com/Mofiqul/dracula.nvim
    -- https://github.com/catppuccin/nvim
    -- Lista de temas disponibles
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                transparent_background = false,
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
                        inlay_hints = { background = true },
                    },
                    cmp = true,
                    lsp_trouble = true,
                    telescope = { enabled = true, style = "classic" },
                    which_key = true,
                },
                custom_highlights = function(colors)
                    return {
                        FloatBorder = { fg = colors.overlay1, bg = colors.base },
                        NormalFloat = { bg = colors.base },
                    }
                end,
            })
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    { "Shatur/neovim-ayu", priority = 1001 },
    { "folke/tokyonight.nvim", priority = 1002 },
    { "lunarvim/horizon.nvim", priority = 1003 },
    { "Mofiqul/dracula.nvim", priority = 1004 },

    -- Configuración del tema predeterminado en LazyVim
    -- {
    --     "LazyVim/LazyVim",
    --     opts = { colorscheme = "ayu-dark" },
    -- },
}
