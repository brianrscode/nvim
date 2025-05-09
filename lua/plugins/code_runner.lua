return {
    "CRAG666/code_runner.nvim",
    config = function()
        local code_runner = require("code_runner")

        code_runner.setup({
            filetype = {
                python = "python3 -u",
                -- Ejecutar programa de Django
                django = "python3 manage.py runserver",
                django_test = "python3 manage.py test",
            },
        })
    end,
    keys = { -- keymap a usar, Comando que realiza, Descripción del comando
        {
            "<leader>rc",
            ":RunCode<cr>",
            desc = "Ejecuta el código acual",
            noremap = true,
            silent = true,
        },
    },
}
