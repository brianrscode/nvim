return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    event = "VeryLazy", -- Retrasa la carga del plugin hasta que Neovim está casi completamente cargado

    config = function()
        vim.diagnostic.config({
            float = { border = "rounded" },
        })

        vim.keymap.set("n", "<leader>if", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>il", vim.diagnostic.setloclist)
        vim.keymap.set("n", "<leader>ir", "<cmd>LspRestart<CR>")

        local lspconfig = require("lspconfig")

        -- Configuración de los servidores
        lspconfig.pyright.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.arduino_language_server.setup({})
        lspconfig.emmet_ls.setup({}) -- Autocompletado para HTML y CSS

        lspconfig.htmx.setup({
            filetypes = { "django-html", "htmldjango", "html" },
        })

        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "🕐",
                    package_uninstalled = "❌",
                },
            },
        })

        local options = {
            ensure_installed = {
                "pyright",
                "django-template-lsp",
                -- "jinja-lsp",
                "arduino-language-server",
                "lua-language-server",
                "emmet-ls",
                "htmx-lsp",
            },
            max_concurrent_installers = 10,
        }

        mason.setup(options)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
        end, {})
    end,
}
