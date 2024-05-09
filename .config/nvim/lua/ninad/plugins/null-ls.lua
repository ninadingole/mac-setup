return {
	"jose-elias-alvarez/null-ls.nvim",
	ft = "go",
	opts = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local sources = {
			null_ls.builtins.formatting.gofmt,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.formatting.golines,
			null_ls.builtins.diagnostics.golangci_lint.with({
				args = { "run", "--fix=true", "--out-format=json" },
			}),
			null_ls.builtins.diagnostics.gofumpt,
			null_ls.builtins.diagnostics.goimports,
		}
		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
