return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = function(_, opts)
        -- Puedes ajustar el estilo de pestañas con esta opción
        opts.options.separator_style = "slant" -- otros valores: "thick", "thin", { '⎺', '⎽' }, etc.
    end,
}
