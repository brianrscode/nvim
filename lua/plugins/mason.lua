-- Plugin spec to enable mason and install LSP servers useful for Python/Django/HTML
-- Adjust the lists below to add/remove servers or tools you want.
return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            -- LSP servers to ensure are installed. Edit this list as needed.
            ensure_installed = {
                "stylua", -- Lua
                "shellcheck", -- Shell scripts
                "shfmt", -- Shell scripts
                "pyright", -- Python
                "html", -- HTML
                "cssls", -- CSS
                "jsonls", -- JSON
            },
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            -- Tools (formatters/linters) to ensure are installed. Edit as needed.
            ensure_installed = {
                -- "black", -- Python formatter
                -- "isort", -- import sorter for Python
                "ruff", -- linter / formatter for Python
                -- "flake8", -- linter (optional if using ruff)
                "djlint", -- Django template linter/formatter
                "prettier", -- general formatter for HTML/CSS/JS
            },
            -- automatically install missing tools when Mason is set up
            automatic_installation = true,
        },
    },
}
