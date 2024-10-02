return {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = true,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    opts = function(_, opts)
        if require("lazyvim.util").has("nvim-dap-python") then
            opts.dap_enabled = true
        end
        return vim.tbl_deep_extend("force", opts, {
            name = {
                "venv",
                ".venv",
                "env",
                ".env",
            },
        })
    end,
    config = function()
        require("venv-selector").setup()
        -- require("lualine").setup({
        --     sections = {
        --         lualine_a = { "mode" },
        --         lualine_b = { "branch" },
        --         lualine_c = {
        --             {
        --                 "filename",
        --                 path = 1,
        --             },
        --             {
        --                 function()
        --                     local vvnv = require("venv-selector")
        --                     local path_v = vvnv.venv()
        --                     if path_v ~= nil then
        --                         _G.current_venv = path_v:match("^.+/(.+)$") -- Guardar el nombre en una variable global
        --                     end
        --                     return _G.current_venv or "" -- Muestra el entorno virtual
        --                 end,
        --                 icon = "🐍", -- 📦, 🧪, ⚙️, 🌱, 💻 🎛️ 🔧 🔍
        --             },
        --         },
        --         lualine_x = { "encoding", "fileformat", "filetype" },
        --         lualine_y = { "progress" },
        --         lualine_z = { "location" },
        --     },
        -- })
    end,
    keys = {
        { "<leader>ve", "<cmd>VenvSelect<cr>", desc = "Selecciona un entorno virtual" },
    },
}
