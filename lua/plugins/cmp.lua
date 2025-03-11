return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter", -- corregido el error de "even"
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- Agregado para iconos en el autocompletado
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
        local lspkind = require("lspkind")

        opts.sources = {
            -- { name = "codeium", priority = 1000 },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
        }

        opts.formatting = {
            expandable_indicator = true,
            fields = { "abbr", "kind", "menu" },
            format = lspkind.cmp_format({
                mode = "symbol",
                maxwidth = 50,
                symbol_map = { Codeium = "" },
                menu = {
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    path = "[Path]",
                },
            }),
        }

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
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
