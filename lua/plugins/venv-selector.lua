return {
	-- https://github.com/linux-cultist/venv-selector.nvim
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {
		-- Nombres a buscar de entornos virtuales
		name = {
			"venv",
			".venv",
			"env",
			".env",
		},
		-- auto_refresh = false
	},
	event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Selecciona un entorno virtual" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		-- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
