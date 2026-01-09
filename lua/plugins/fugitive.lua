local function git_cmd(cmd_base, opts)
    opts = opts or {}
    if opts.prompt then
        vim.ui.input({ prompt = opts.prompt }, function(input)
            if input then
                vim.cmd("Git " .. cmd_base .. " " .. vim.fn.shellescape(input))
                if opts.notify then
                    vim.notify(opts.notify .. input)
                end
            end
        end)
    else
        vim.cmd("Git " .. cmd_base)
        if opts.notify then
            vim.notify(opts.notify)
        end
    end
end

return {
    "tpope/vim-fugitive", -- Este plugin permite usar los comandos de git dentro de neovim
    cmd = { "G", "Git" },
    keys = { -- keymap a usar, Comando que realiza, Descripción del comando
        -- { "<leader>gP", ":Git pull origin main<cr>", desc = "Git pull: Trae cambios del repo remoto al local." },
        -- { "<leader>gl", ":Git log --oneline<cr>", desc = "Git log: Muestra los logs del repo." },
        { "<leader>gt", ":Git tree<cr>", desc = "Git tree: Muestra historial de cambios." },
        {
            "<leader>gi",
            function()
                git_cmd("init", {
                    notify = "Repositorio Git inicializado.",
                })
            end,
            desc = "Git init: Inicializa nuevo repo.",
        },
        {
            "<leader>gp",
            function()
                git_cmd("push origin", {
                    prompt = "Nombre de la rama a pushear:",
                    notify = "Cambios pusheados a la rama ",
                })
            end,
            desc = "Git push: Manda cambios al repo remoto.",
        },
        {
            "<leader>ga",
            function()
                git_cmd("add .", {
                    notify = "Cambios agregados al área de staging",
                })
            end,
            desc = "Git add: Agrega cambios al repo actual.",
        },
        {
            "<leader>gc",
            function()
                git_cmd("commit -m", {
                    prompt = "Mensaje del commit:",
                    notify = "Commit realizado: ",
                })
            end,
            desc = "Git commit: Realiza un commit con mensaje.",
        },
    },
}
