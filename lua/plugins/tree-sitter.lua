return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    -- treesitter permite leer código de la misma manera que un compilador
    -- Escanea el código, recolecta la información de cada simbilo y genera un árbol de sintaxis.
    -- Convierte el código en una estructura de datos que Neovim puede consultar
    "nvim-treesitter/nvim-treesitter", -- Crea un arbol de coloreado para la sintaxis de lenguajes
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = "VeryLazy", -- Cuando se cargue el editor se cargaa treesitter
    main = "nvim-treesitter.configs",

    -- config = function ()
    --   require("ibl").setup()
    -- end,

    opts = {
        ensure_installed = {
            "python",
            "html",
            "css",
            "javascript",
            "bash",
            "json",
            "markdown",
            "markdown_inline",
            "vim",
            "regex",
            "lua",
            "luadoc",
            -- "java",
            -- "php",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                },
            },
        },
    },
}
