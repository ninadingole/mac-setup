return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"lua_ls",
				"prismals",
				"gopls",
				"golangci_lint_ls",
				"kotlin_language_server",
				"intelephense",
				"taplo",
				"terraformls",
				"bashls",
				"jsonls",
				"autotools_ls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
				"golangci-lint", -- golangci-lint linter
				"gotests",
				"gofumpt",
				"gomodifytags",
				"golines",
				"shellcheck",
			},
		})
	end,
}
