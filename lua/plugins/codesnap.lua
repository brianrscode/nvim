return {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
        require("codesnap").setup({
            mac_window_bar = false,
            title = "CodeSnap.nvim",
            code_font_family = "Mononoki Nerd Font",
            watermark_font_family = "Pacifico",
            border = "rounded",
            watermark = "", -- CodeSnap.nvim
            bg_theme = "grape",
            -- bg_color = "#00000000",
            -- bg_x_padding = 122,
            -- bg_y_padding = 82,
            bg_padding = 0, -- Oculta el background
            breadcrumbs_separator = "/", -- Separador de directorios
            has_breadcrumbs = false,
            has_line_number = false,
            show_workspace = false,
            min_width = 0,
            save_path = os.getenv(os.getenv("HOME") .. "/Pictures"),
        })
    end,
}
