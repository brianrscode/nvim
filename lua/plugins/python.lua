return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    settings = {
                        python = {
                            analysis = {
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
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_fix", "ruff_format" },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                python = { "ruff" },
            },
        },
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        config = function()
            local mason_registry = require("mason-registry")
            local debugpy_python = "python"
            local is_windows = vim.fn.has("win32") == 1

            if mason_registry.is_installed("debugpy") then
                local debugpy = mason_registry.get_package("debugpy")
                debugpy_python = debugpy:get_install_path()
                    .. (is_windows and "/venv/Scripts/python.exe" or "/venv/bin/python")
            end

            require("dap-python").setup(debugpy_python)
        end,
    },
}
