return {
	-- https://github.com/neovim/nvim-lspconfig/tree/master
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	-- lsp son configuraciones existenes para los servidores
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim", -- Mason se debe iniciar Mason antes del lspconfig
		"folke/neodev.nvim", -- Dependencia para Lua
	},

	config = function()
		require("neodev").setup()

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		----------- Configuración de los servidores de lenguajes -----------
		local lspconfig = require("lspconfig")
		local servers = { "jdtls", "pyright", "lua_ls" }

		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})
		lspconfig.html.setup({
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				autostart = true,
				setting = {
					workspace = {
						telemetry = { enable = false },
					},
				},
			})
		end
	end,
}
