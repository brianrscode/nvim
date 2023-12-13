return {
	{
		-- https://github.com/williamboman/mason.nvim
		-- https://github.com/williamboman/mason-lspconfig.nvim
		-- Mason es un package manager, que permite instalar herramientas incluidos los LSP
		"williamboman/mason.nvim",
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
		opts = {
			ensure_installed = {
				"pyright",
				"jdtls",
				"java-test",
				"java-debug-adapter",
				"lua-language-server",
				"python-lsp-server",
			},
		},
		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint", -- python linter
					"eslint_d", -- js linter
				},
			})
		end,
	},
}
