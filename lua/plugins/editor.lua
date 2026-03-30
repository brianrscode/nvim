-- This file contains the configuration for various Neovim plugins related to the editor.

local function hsl_to_hex(h, s, l)
    h = (h or 0) % 360
    s = math.max(0, math.min(100, s or 0)) / 100
    l = math.max(0, math.min(100, l or 0)) / 100

    local c = (1 - math.abs(2 * l - 1)) * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = l - c / 2

    local r, g, b = 0, 0, 0
    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end

    local function to_byte(v)
        return math.floor((v + m) * 255 + 0.5)
    end

    return string.format("#%02X%02X%02X", to_byte(r), to_byte(g), to_byte(b))
end

return {
    {
        -- Plugin: goto-preview
        -- URL: https://github.com/rmagatti/goto-preview
        -- Description: Provides preview functionality for definitions, declarations, implementations, type definitions, and references.
        "rmagatti/goto-preview",
        event = "BufEnter", -- Load the plugin when a buffer is entered
        config = true, -- Enable default configuration
        keys = {
            {
                "gpd",
                "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
                noremap = true, -- Do not allow remapping
                desc = "goto preview definition", -- Description for the keybinding
            },
            {
                "gpD",
                "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
                noremap = true,
                desc = "goto preview declaration",
            },
            {
                "gpi",
                "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
                noremap = true,
                desc = "goto preview implementation",
            },
            {
                "gpy",
                "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
                noremap = true,
                desc = "goto preview type definition",
            },
            {
                "gpr",
                "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
                noremap = true,
                desc = "goto preview references",
            },
            {
                "gP",
                "<cmd>lua require('goto-preview').close_all_win()<CR>",
                noremap = true,
                desc = "close all preview windows",
            },
        },
    },
    {
        -- Plugin: mini.hipatterns
        -- URL: https://github.com/nvim-mini/mini.hipatterns
        -- Description: Provides highlighter patterns for various text patterns.
        "nvim-mini/mini.hipatterns",
        event = "BufReadPre", -- Load the plugin before reading a buffer
        opts = {
            highlighters = {
                hsl_color = {
                    pattern = "hsl%(%d+,? %d+,? %d+%)", -- Pattern to match HSL color values
                    group = function(_, match)
                        local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
                        h, s, l = tonumber(h), tonumber(s), tonumber(l)
                        local hex_color = hsl_to_hex(h, s, l)
                        return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                    end,
                },
            },
        },
    },
}
