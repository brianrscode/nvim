return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    even = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        { "nvim-snippets", enabled = true },
        { "L3MON4D3/LuaSnip", version = "v1.*" },
        "windwp/nvim-autopairs",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local luasnip = require("luasnip")
        local cmp = require("cmp")

        opts.sources = {
            -- { name = "codeium", priority = 1000 }, -- Codeium
            { name = "nvim_lsp" }, -- LSPs (por ejemplo: pyright, ruff, etc.)
            { name = "path" }, -- Rutas de archivo
            { name = "luasnip" }, -- Snippets
            { name = "buffer" },
        }

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- this way you will only jump inside the snippet region
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })
    end,
}
