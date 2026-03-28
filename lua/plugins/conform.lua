return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This is where we merge the two plugins' logic
		dependencies = { "zapling/mason-conform.nvim" },
		config = function()
			-- 1. Setup the Mason bridge first
			require("mason-conform").setup()

			-- 2. Setup conform itself
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- python = { 'isort', 'ruff' },
					-- javascript = { { "prettierd", "prettier" } },
					-- typescript = { { "prettierd", "prettier" } },
					-- json = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
