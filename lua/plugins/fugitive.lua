return {
    -- https://github.com/tpope/vim-fugitive
    "tpope/vim-fugitive", -- Este plugin permite usar los comandos de git dentro de neovim
    cmd = { "G", "Git" },
    keys = { -- keymap a usar, Comando que realiza, Descripción del comando
        { "<leader>gi", ":Git init<cr>", desc = "Git init: Inicializa nuevo repo." },
        { "<leader>ga", ":Git add .<cr>", desc = "Git add: Agrega cambios al repo actual." },
        { "<leader>gp", ":Git push origin main<CR>", desc = "Git push: Manda cambios al repo remoto." },
        { "<leader>gt", ":Git tree<cr>", desc = "Git tree: Muestra historial de cambios." },
        -- {"<leader>gs", ":Git status<cr>", desc = "Git status: Muestra el estado del repo actual."},
        -- {"<leader>gpu", ":Git pull origin main<cr>", desc = "Git pull: Trae cambios del repo remoto al local."},
        -- { "<leader>gl", ":Git log --oneline<cr>", desc = "Git log: Muestra los logs del repo." },
        {
            "<leader>gc",
            function()
                vim.ui.input({ prompt = "Mensaje del commit:" }, function(input)
                    if input then
                        vim.cmd("Git commit -m " .. vim.fn.shellescape(input))
                    end
                end)
            end,
            desc = "Git commit: Agrega commit al repo actual.",
            noremap = true,
            silent = true,
        },
        {
            "<leader>gC",
            function()
                vim.ui.input({ prompt = "Nombre de la rama:" }, function(input)
                    if input then
                        vim.cmd("Git checkout -b " .. vim.fn.shellescape(input))
                        vim.notify("Se ha creado y cambiado a la rama " .. input)
                    end
                end)
            end,
            desc = "Git checkout -b: Nueva rama y cambio a ella",
        },
        {
            "<leader>gr",
            function()
                vim.ui.input({ prompt = "URL del repo remoto:" }, function(input)
                    if input then
                        vim.cmd("Git remote add origin " .. vim.fn.shellescape(input))
                        vim.notify("Rama remota agregada correctamente")
                    end
                end)
            end,
            desc = "Git remote: Agrega un repo remoto.",
        },
    },
}
