return {
	-- https://github.com/tpope/vim-fugitive
	"tpope/vim-fugitive", -- Este plugin permite usar los comandos de git dentro de neovim
	cmd = { "G", "Git" },
	keys = { -- keymap a usar, Comando que realiza, Descripción del comando
		{ "<leader>gi", ":Git init<cr>", desc = "Git init: Inicializa nuevo repo." },
		-- {"<leader>gs", ":Git status<cr>", desc = "Git status: Muestra el estado del repo actual."},
		-- {"<leader>ga", ":Git add .<cr>", desc = "Git add: Agrega nuevos cambios al repo actual."},
		-- {"<leader>gc", ":Git commit<cr>", desc = "Git commit: Agrega el nuevo commit al repo actual."},
		{ "<leader>gr", ":Git remote add origin", desc = "Git remote: Agrega un repo remoto." },
		-- {"<leader>gp", ":Git push origin main<cr>", desc = "Git push: Manda cambios al repo remoto."},
		-- {"<leader>gpu", ":Git pull origin main<cr>", desc = "Git pull: Trae cambios del repo remoto al local."},
		{ "<leader>gl", ":Git log --oneline<cr>", desc = "Git log: Muestra los logs del repo." },
	},
}
