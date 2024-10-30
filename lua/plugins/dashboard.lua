return {
    -- https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
        local logo = [[
            ⠀⠀⠀⢀⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠛⠙⣎⠛⠳⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠛⠙⠒⣶⣾⣯⣤⢶⣤⣌⠉⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣈⣳⣄⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⢀⡴⠚⢉⣭⠽⣿⡿⠀⢠⣇⠀⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⠀⠸⣇⠀⠈⠛⠛⠉⣀⣠⡾⠛⣆⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⠀⢀⡴⠛⠛⠿⠟⠛⠛⢿⣿⡇⠀⢹⠀⠀⠀⠀⠀⠀⠀
            ⠀⠀⢠⡏⠀⣤⠖⠛⠛⠛⠛⢚⣿⠇⠀⣸⣄⠀⠀⠀⠀⠀⠀
            ⠀⠀⠘⢧⡀⠙⠓⠶⠶⠒⠛⠉⢁⣠⣾⡇⠘⡇⠀⠀⠀⠀⠀
            ⠀⠀⠀⣀⣭⠿⠶⠶⠶⠶⠶⢿⣯⣁⢸⡇⠀⣿⠀⠀⠀⠀⠀
            ⠀⢀⡾⠉⠀⣠⡤⠤⠤⠤⣤⣀⠙⣿⡿⠁⢠⡏⠀⠀⠀⣾⡆
            ⠀⢸⡁⠀⠸⣯⣀⡀⣀⣀⣀⣩⡿⠟⠁⣠⡿⠶⠤⠤⢚⡽⠀
            ⠀⠀⠳⣤⣀⠀⠉⠉⠉⠉⠀⠀⣀⣤⡾⠛⠿⠦⠴⠖⠋⠀⠀
            ⠀⠀⠀⠈⠛⠛⠛⠛⠿⠖⠚⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]]

        logo = string.rep("", 8) .. logo .. "\n"

        local opts = {
            theme = "doom",
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                -- stylua: ignore
                center = {
                  { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
                  { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                  { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
                  { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
                  { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
                  { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                  { action = ":checkhealth", desc = " Check Health", icon = "󰓙 ", key = "c" },
                  { action = "qa", desc = " Quit", icon = " ", key = "q" },
                  -- { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
                  -- { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config", icon = " ", key = "c" },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        return opts
    end,
}
