return {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "folke/snacks.nvim" },
    ft = "python", -- Load when opening Python files
    keys = {
        { "<leader>ve", "<cmd>VenvSelect<cr>", desc = "Selecciona un entorno virtual" },
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
        options = {
            picker = "snacks",
        }, -- if you add plugin options, they go here.
        search = {}, -- if you add your own searches, they go here.
    },
}
