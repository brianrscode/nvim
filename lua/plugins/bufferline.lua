return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = function()
		require("bufferline").setup({
			options = {
				separator_style = "padded_slant", --  ▎
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = "none",
				close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
				-- NOTE: this plugin is designed with this icon in mind,
				-- and so changing this is NOT recommended, this is intended
				-- as an escape hatch for people who cannot bear it for whatever reason
				indicator = {
					icon = "slant",
					style = "icon",
				},
				buffer_close_icon = "",
				modified_icon = "", -- 󰧟󰧟 ● 
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
			},
		})
	end,
}
