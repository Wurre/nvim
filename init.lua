if vim.g.vscode then
	require("plugins.vscode_config")
else
	require("options")
	require("keymaps")

	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.hl.on_yank()
		end,
	})

	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		local lazyrepo = "https://github.com/folke/lazy.nvim.git"
		local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
		if vim.v.shell_error ~= 0 then
			error("Error cloning lazy.nvim:\n" .. out)
		end
	end

	---@type vim.Option
	local rtp = vim.opt.runtimepath:prepend(lazypath)

	local nvim_theme = "nord"

	-- Define a table of theme modules
	local themes = {
		nord = "plugins.themes.nord",
		onedark = "plugins.themes.onedark",
	}

	-- Plugins excluded in VS Code
	-- local vscode_excl_plugins = {}
	-- if not vim.g.vscode then
	-- 	vscode_excl_plugins = {
	-- 	}
	-- end

	local plugins = {
		require(themes[nvim_theme]),
		require("plugins.lsp"),
		require("plugins.conform"),
		require("plugins.telescope"),
		require("plugins.treesitter"),
		require("plugins.mini"),
		require("plugins.neo-tree"),
	}
	-- table.move(vscode_excl_plugins, 1, #vscode_excl_plugins, #plugins + 1, plugins)

	require("lazy").setup({
		plugins,
	})
end
