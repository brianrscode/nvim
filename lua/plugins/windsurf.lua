return {
    "Exafunction/windsurf.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({})
        -- require("cmp").setup({
        --     formatting = {
        --         format = require("lspkind").cmp_format({
        --             mode = "symbol",
        --             maxwidth = 50,
        --             ellipsis_char = "...",
        --             symbol_map = { Codeium = "🧪" },
        --         }),
        --     },
        -- })
    end,
}
