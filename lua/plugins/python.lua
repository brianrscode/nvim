return {
    -- Plugon: lspconfig
    -- URL: https://github.com/neovim/nvim-lspconfig
    -- Description: nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP client.
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    settings = {
                        python = {
                            analysis = { -- Analysis settings for the Pyright language server
                                typeCheckingMode = "basic",
                                autoImportCompletions = true,
                                diagnosticMode = "workspace",
                                inlayHints = {
                                    functionReturnTypes = true,
                                    variableTypes = true,
                                },
                            },
                        },
                    },
                },
                ruff = {},
            },
        },
    },
    -- Plugin: conform.nvim
    -- URL: https://github.com/stevearc/conform.nvim
    -- Description: A Neovim plugin for formatting code using external formatters, with support for multiple formatters per filetype and automatic installation via Mason.
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_fix", "ruff_format" },
            },
        },
    },
    -- Plugin: nvim-lint
    -- URL: https://github.com/mfussenegger/nvim-lint
    -- Description: A Neovim plugin for linting code using external linters, with support for multiple linters per filetype and automatic installation via Mason.
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                python = { "ruff" },
            },
        },
    },
    -- Plugin: nvim-dap-python
    -- URL: https://github.com/mfussenegger/nvim-dap-python
    -- Description:
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        config = function()
            local dap_python = require("dap-python")

            if vim.fn.executable("uv") == 1 then
                dap_python.setup("uv")
                return
            end

            local ok, mason_registry = pcall(require, "mason-registry")
            if ok and mason_registry.is_installed("debugpy") then
                local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
                local debugpy = mason_registry.get_package("debugpy")
                local debugpy_python = debugpy:get_install_path()
                    .. (is_windows and "/venv/Scripts/python.exe" or "/venv/bin/python")

                dap_python.setup(debugpy_python)
                return
            end

            dap_python.setup("python")
        end,
    },
}
