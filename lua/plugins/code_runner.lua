return {
	"CRAG666/code_runner.nvim",
	config = function()
		local code_runner = require("code_runner")

		code_runner.setup({
			filetype = {
				java = {
					"cd $dir &&",
					"javac $fileName &&",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				typescript = "deno run",
				rust = {
					"cd $dir &&",
					"rustc $fileName &&",
					"$dir/$fileNameWithoutExt",
				},
			},
		})
	end,
	keys = { -- keymap a usar, Comando que realiza, Descripción del comando
		{ "<leader>r", ":RunCode<cr>", desc = "Ejecuta el código acual" },
	},
}
