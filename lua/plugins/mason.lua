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
            -- LSP servers only.
            ensure_installed = {
                "pyright", -- Python
                "ruff", -- Python lint/analysis server
                "html", -- HTML
                "cssls", -- CSS
                "jsonls", -- JSON
                "lua_ls", -- Lua
            },
        },
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            -- External tools (formatters/linters/debuggers).
            ensure_installed = {
                "stylua", -- Lua formatter
                "shellcheck", -- Shell linter
                "shfmt", -- Shell formatter
                "ruff", -- linter / formatter for Python
                "debugpy", -- Python debugger
                "djlint", -- Django template linter/formatter
                "prettier", -- general formatter for HTML/CSS/JS
            },
            -- automatically install missing tools when Mason is set up
            automatic_installation = true,
        },
    },
}
