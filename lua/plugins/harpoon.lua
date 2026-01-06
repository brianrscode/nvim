return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
        { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Agrega marca" },
        { "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Muestra marcas" },

        { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Siguiente marca" },
        { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Anterior marca" },

        -- { "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Primer marca" },
        -- { "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Segundo marca" },
        -- { "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Tercer marca" },
        -- { "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Cuarto marca" },
    },
}
