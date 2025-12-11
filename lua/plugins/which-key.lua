return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- minimal style
		preset = "classic",
		show_help = false,
		show_keys = true,

		-- window layout
		win = {
			border = "single",
			padding = { 1, 2 },
			no_overlap = true,
			title = false,
		},

		layout = {
			height = { min = 30, max = 30 },
			width = { min = 30, max = 30 },
			spacing = 2,
		},

		keys = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},
	},

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Show keymaps",
		},
	},
}
