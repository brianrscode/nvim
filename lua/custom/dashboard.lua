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
            { icon = " ", key = "o", desc = "OpenCode", action = ":lua require('opencode').toggle()" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            {
                icon = " ", --🚀
                key = "c",
                desc = "Config",
                action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "⛧ ", key = "l", desc = "Lazy", action = ":Lazy" }, --   󰒲
            { icon = "✓ ", key = "m", desc = "Mason", action = ":Mason" }, -- ✓
            { icon = " ", key = "x", desc = "Lazy extras", action = ":LazyExtras" }, -- 
            { icon = "󰓙  ", key = "h", desc = "Checkhealth", action = ":checkhealth" }, -- 󰓙 🩺 🩻 🖤
            { icon = "󰦛 ", key = "s", desc = "Restore session", action = 'lua require("persistence").load()' },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" }, --  ☠️
        },
    },
    sections = {
        -- PANE 1
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },

        -- PANE 2
        {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
                Snacks.gitbrowse()
            end,
        },
        {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
                return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames", --    git --no-pager diff --stat -B -M -C
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
        },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },

        { section = "startup" },
    },
}
