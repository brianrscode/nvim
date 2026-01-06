local mode = {
    "mode",
    fmt = function(s)
        local mode_map = {
            ["NORMAL"] = "N",
            ["O-PENDING"] = "N?",
            ["INSERT"] = "I",
            ["VISUAL"] = "V",
            ["V-BLOCK"] = "VB",
            ["V-LINE"] = "VL",
            ["V-REPLACE"] = "VR",
            ["REPLACE"] = "R",
            ["COMMAND"] = "!",
            ["SHELL"] = "SH",
            ["TERMINAL"] = "T",
            ["EX"] = "X",
            ["S-BLOCK"] = "SB",
            ["S-LINE"] = "SL",
            ["SELECT"] = "S",
            ["CONFIRM"] = "Y?",
            ["MORE"] = "M",
        }
        return mode_map[s] or s
    end,
}

return {

    -- Plugin: folke/todo-comments.nvim
    -- URL: https://github.com/folke/todo-comments.nvim
    -- Description: Plugin to highlight and search for TODO, FIX, HACK, etc. comments in your code.
    -- IMPORTANT: using version "*" to fix a bug
    { "folke/todo-comments.nvim", version = "*" },

    -- Plugin: incline.nvim
    -- URL: https://github.com/b0o/incline.nvim
    -- Description: A Neovim plugin for showing the current filename in a floating window.
    {
        "b0o/incline.nvim",
        event = "BufReadPre", -- Load this plugin before reading a buffer
        priority = 1200, -- Set the priority for loading this plugin
        config = function()
            require("incline").setup({
                window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
                hide = {
                    cursorline = true, -- Hide the incline window when the cursorline is active
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename -- Indicate if the file is modified
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
                    return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
                end,
            })
        end,
    },

    -- Plugin: lualine.nvim
    -- URL: https://github.com/nvim-lualine/lualine.nvim
    -- Description: A blazing fast and easy to configure Neovim statusline plugin.
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
        requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
        opts = {
            options = {
                -- theme = "gentleman-kanagawa-blur", -- Set the theme for lualine
                icons_enabled = true, -- Enable icons in the statusline
            },
            sections = {
                lualine_a = {
                    {
                        "mode", -- Display the current mode
                        -- icon = "󱙧", -- Set the icon for the mode
                    },
                },
            },
            extensions = {
                "quickfix",
                {
                    filetypes = { "oil" },
                    sections = {
                        lualine_a = {
                            mode,
                        },
                        lualine_b = {
                            function()
                                local ok, oil = pcall(require, "oil")
                                if not ok then
                                    return ""
                                end

                                ---@diagnostic disable-next-line: param-type-mismatch
                                local path = vim.fn.fnamemodify(oil.get_current_dir(), ":~")
                                return path .. " %m"
                            end,
                        },
                    },
                },
                {
                    filetypes = { "codecompanion" },
                    sections = {
                        lualine_a = {
                            mode,
                        },
                        lualine_b = {
                            codecompanion_adapter_name,
                        },
                        lualine_c = {
                            codecompanion_current_model_name,
                        },
                        lualine_x = {},
                        lualine_y = {
                            "progress",
                        },
                        lualine_z = {
                            "location",
                        },
                    },
                    inactive_sections = {
                        lualine_a = {},
                        lualine_b = {
                            codecompanion_adapter_name,
                        },
                        lualine_c = {},
                        lualine_x = {},
                        lualine_y = {
                            "progress",
                        },
                        lualine_z = {},
                    },
                },
            },
        },
    },
}
