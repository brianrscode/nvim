return {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
    keys = {
        { "<leader>ce", "<cmd>RunCode<cr>", desc = "Ejecutar código" },
        { "<leader>cf", "<cmd>RunFile<cr>", desc = "Ejecutar archivo actual" },
        { "<leader>cp", "<cmd>RunProject<cr>", desc = "Ejecutar proyecto" },
        { "<leader>cc", "<cmd>RunClose<cr>", desc = "Cerrar runner" },
    },
    opts = {
        mode = "float",
        focus = false,
        startinsert = false,
        term = {
            position = "bot",
            size = 14,
        },
        filetype = {
            python = function()
                if vim.fn.executable("uv") == 1 then
                    return "uv run python -u"
                end
                if vim.fn.executable("python3") == 1 then
                    return "python3 -u"
                end
                return "python -u"
            end,
        },
    },
}
