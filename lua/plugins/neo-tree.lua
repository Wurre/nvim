return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
	opts = {
        filesystem = {
            window = {
              mappings = {
                ['\\'] = 'close_window',
              },
            },
            filtered_items = {
                visible = false, -- hide filtered items on open
                hide_gitignored = true,
                hide_dotfiles = false,
                hide_by_name = {
                    ".github",
                    ".gitignore",
                    "package-lock.json",
                    ".changeset",
                    ".prettierrc.json",
                },
                never_show = { ".git" },
            },
        },
    },
}
