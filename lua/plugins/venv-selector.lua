return {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "folke/snacks.nvim" },
    ft = "python", -- Load when opening Python files
    keys = {
        { "<leader>ve", "<cmd>VenvSelect<cr>", desc = "Selecciona un entorno virtual" },
    },
    opts = {
        options = {
            picker = "snacks",
            notify_user_on_venv_activation = true,
            log_level = "NONE",
            on_venv_activate_callback = function()
                local ok, venv_selector = pcall(require, "venv-selector")
                if ok and type(venv_selector.restart_lsp_servers) == "function" then
                    venv_selector.restart_lsp_servers()
                    return
                end

                vim.cmd("LspRestart")
            end,

            statusline_func = {
                lualine = function()
                    local venv_path = require("venv-selector").venv()
                    if not venv_path then
                        return ""
                    end
                    local venv_name = vim.fn.fnamemodify(venv_path, ":t")
                    local icon, _ = require("mini.icons").get("filetype", "python")
                    -- return "🐍" .. venv_name
                    -- return "󰌠" .. venv_name
                    return icon .. " " .. venv_name
                end,
            },
        },
        search = {},
    },
}
