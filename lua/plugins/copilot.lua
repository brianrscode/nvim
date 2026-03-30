return {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
        panel = { enabled = false },
        suggestion = {
            enabled = true,
            auto_trigger = true,
        },
        filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
        },
    },
}
