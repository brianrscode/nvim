return {
    "blink.cmp",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    opts = {
        completion = {
            documentation = {
                auto_show = true, -- 🔥 disable doc popup on selection
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
            },
            ghost_text = {
                enabled = false, -- 🔥 disable inline ghost text
                show_with_menu = true, -- 🔥 disable ghost text when menu is open
            },
            menu = {
                border = vim.g.border_style, --"rounded",
                scrolloff = 1,
                scrollbar = false,
                auto_show = true, -- ✅ still allow menu to show
            },
            list = {
                selection = {
                    preselect = false, -- optional: don’t auto-select first
                    auto_insert = false, -- optional: don’t insert preview inline
                },
            },
            draw = {
                columns = {
                    { "kind_icon", "label", "label_description", gap = 1 },
                    -- { "label", "label_description", gap = 1 },
                    -- { "kind_icon", "kind" },
                },
            },
            sources = { "lsp", "path", "snippets", "buffer" },
        },
        window = {
            min_width = 23,
            -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
        },
        appearance = {
            -- doc_border = "none",
            nerd_font_variant = "mono",
            kind_icons = {
                Codeium = "🧪 ",
                Text = "📝 ",
                Method = "🐍 ", --󰊕
                Function = "🐍 ",
                Constructor = "⭐ ", -- 󰒓

                Field = "🏷️ ", --󰜢
                Variable = "📦 ", --󰆦
                Property = "🔧", -- 󰖷

                Class = "💀 ", -- 󱡠
                Interface = "💀 ",
                Struct = "💀 ",
                Module = "💀 ",

                Unit = "󰪚",
                Value = "󰦨",
                Enum = "󰦨",
                EnumMember = "󰦨",

                Keyword = "🪪 ", -- 󰻾
                Constant = "🔥", -- 󰏿

                Snippet = "🚀 ", -- 󱄽
                Color = "🎨 ", -- 󰏘
                File = "📄 ", -- 󰈔  📃
                Reference = "🚩 ", -- 󰬲
                Folder = "📂 ", -- 󰉋
                Event = "🌩️ ", -- 󱐋
                Operator = "󰪚",
                TypeParameter = "󰬛",
            },
        },
    },
}
