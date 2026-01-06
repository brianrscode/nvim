return {
    -- INSTALAR LA HERRAMIENTA: https://imagemagick.org/script/download.php
    enabled = true,
    doc = {
        float = false,
        inline = true,
        max_width = 50,
        max_height = 30,
        wo = {
            wrap = true,
        },
    },
    convert = {
        notify = true,
        command = "magick",
    },
    img_dirs = { "imgs", "images", "assets", "static", "public", "media", "~/Desktop" },
}
