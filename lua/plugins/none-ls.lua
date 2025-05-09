return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.diagnostics.ruff,
                -- null_ls.builtins.diagnostics.mypy, -- opcional

                -- Django templates
                null_ls.builtins.formatting.djlint,
                null_ls.builtins.diagnostics.djlint,

                -- Otros útiles
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.markdownlint,
            },
        })
    end,
}
