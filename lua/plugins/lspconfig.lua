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

        vim.keymap.set("n", "<leader>rl", "<cmd>LspRestart<CR>")

        local lspconfig = require("lspconfig")

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
                "pyright", -- LSP -> Autocompletado, detección de errores y tipado (pylance)
                "debugpy", -- DAP (Debug Adapter Protocol) -> Debugging python
                "ruff", -- Linter -> formateo de código y detección de errores de estilo
                "python-lsp-server",
                "ruff-lsp",
                -- "isort", -- Linter -> Ordenamiento de imports
                "django-template-lsp", -- LSP para plantillas Django | Autocompletado y detección de errores
                "djlint", -- Linter -> Formateado para templates django

                "emmet-ls", -- servidor de lenguaje para HTML y CSS

                "markdown-toc", -- Genera tablas de contenidos (TOC)
                "markdownlint-cli2", -- Linter para Markdown para buenas prácticas
                "marksman", -- LSP -> Autocompletado, formateo y navegación prácticas

                "lua-language-server", -- LSP para Lua -> Autocompletado, linting y detección de errores
                "stylua", -- Formateador de código Lua

                "taplo", -- LSP para archivos TOML

                -- "jinja-lsp",
                -- "htmx-lsp",
            },
            max_concurrent_installers = 10,
        }

        -- Configuración de los servidores LSP
        lspconfig.djlsp.setup({
            cmd = { "djlsp" },
            filetypes = { "django-html", "htmldjango" },
            root_dir = { "manage.py" }, -- pyproject.toml .git --Raíz -> Se activa solo en proyectos Django
        })
        lspconfig.pyright.setup({})
        lspconfig.emmet_ls.setup({}) -- Autocompletado para HTML y CSS
        lspconfig.tsserver.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.marksman.setup({})
        lspconfig.taplo.setup({})
        -- lspconfig.htmx.setup({})

        -- lspconfig.htmx.setup({
        --     filetypes = { "django-html", "htmldjango", "html" },
        -- })

        mason.setup(options)
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
        end, {})
    end,
}
