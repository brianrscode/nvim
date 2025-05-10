return {
    "blink.cmp",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    opts = {
        completion = {
            list = {
                selection = {
                    preselect = false, -- optional: don’t auto-select first
                    auto_insert = false, -- optional: don’t insert preview inline
                },
            },
            menu = {
                enabled = true,
                border = "rounded", -- https://cmp.saghen.dev/recipes.html#border
                scrolloff = 1,
                -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                scrollbar = true,
                auto_show = true, -- ✅ still allow menu to show

                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon", "label", "label_description", gap = 1 },
                        -- { "label", "label_description", gap = 1 },
                        -- { "kind_icon", "kind" },
                    },
                },
            },
            documentation = {
                auto_show = true, -- 🔥 disable doc popup on selection
                auto_show_delay_ms = 0,
                treesitter_highlighting = true,
                window = {
                    border = "rounded",
                },
            },
            ghost_text = {
                enabled = false, -- 🔥 disable inline ghost text
                show_with_menu = true, -- 🔥 disable ghost text when menu is open
            },
        },
        signature = {
            window = {
                border = "rounded",
            },
        },
        appearance = {
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
