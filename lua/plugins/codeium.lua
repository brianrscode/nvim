-- return {
--     "Exafunction/codeium.nvim",
--     cmd = "Codeium",
--     build = ":Codeium Auth",
--     opts = {},
-- }
return {
    "Exafunction/codeium.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            cmd = "Codeium",
            build = ":Codeium Auth",
            opts = {},
        })
    end,
}
