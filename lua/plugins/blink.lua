return {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "saghen/blink.compat" },
    opts = function(_, opts)
        local has_avante = pcall(require, "avante")
        if not has_avante then
            return opts
        end

        opts.sources = opts.sources or {}
        opts.sources.default = opts.sources.default or {}
        opts.sources.compat = opts.sources.compat or {}
        opts.sources.providers = opts.sources.providers or {}

        local avante_sources = { "avante_commands", "avante_mentions", "avante_files" }

        for _, source in ipairs(avante_sources) do
            if not vim.tbl_contains(opts.sources.default, source) then
                table.insert(opts.sources.default, source)
            end
            if not vim.tbl_contains(opts.sources.compat, source) then
                table.insert(opts.sources.compat, source)
            end
        end

        opts.sources.providers = vim.tbl_deep_extend("force", opts.sources.providers, {
            avante_commands = {
                name = "avante_commands",
                module = "blink.compat.source",
                score_offset = 90,
                opts = {},
            },
            avante_files = {
                name = "avante_files",
                module = "blink.compat.source",
                score_offset = 100,
                opts = {},
            },
            avante_mentions = {
                name = "avante_mentions",
                module = "blink.compat.source",
                score_offset = 1000,
                opts = {},
            },
        })

        return opts
    end,
}
