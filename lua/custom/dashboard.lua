return {
    enabled = true,
    preset = {
        header = [[
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
    ]],
        keys = {
            {
                icon = " ",
                key = "c",
                desc = "Config",
                action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" }, -- ⛧
            { icon = "✓ ", key = "m", desc = "Mason", action = ":Mason" },
            { icon = " ", key = "x", desc = "Lazy extras", action = ":LazyExtras" },
            { icon = "󰓙 ", key = "h", desc = "Checkhealth", action = ":checkhealth" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            { icon = "🍉 ", key = "s", desc = "Restore session", action = 'lua require("persistence").load()' },
        },
    },
    sections = {
        -- { section = "header" },
        -- { section = "keys", gap = 1, padding = 1 },
        -- { section = "startup" },
        { section = "header" },
        {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
                return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
        },
        { section = "startup" },
    },
}
