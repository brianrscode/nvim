return {
    "nvzone/volt",
    "nvzone/minty",
    lazy = true,
    cmd = { "Shades", "Huefy" },

    -- keys = {
    --     { "<leader>m", ":Huefy<CR>", desc = "  Color Picker" },
    -- },
    -- vim.keymap.set({ "n" }, "<leader>m", function()
    --     require("menu").open({
    --         { name = "separator" },
    --         {
    --             name = "  Color Picker",
    --             hl = "@comment.warning",
    --             cmd = function()
    --                 require("minty.huefy").open()
    --             end,
    --             rtxt = "p",
    --         },
    --     })
    -- end),
}
