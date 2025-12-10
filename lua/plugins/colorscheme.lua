return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	config = function()
		require("kanagawa").setup({
			compile = true, -- enable compilation for faster startup
			undercurl = true, -- undercurl support
			commentStyle = { italic = true },
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			transparent = false, -- set to true if you want terminal transparency
			terminalColors = true, -- set terminal colors
			theme = "wave", -- default theme
			background = {
				dark = "wave",
				light = "lotus",
			},
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none", -- remove gutter background
						},
					},
				},
			},
			overrides = function(colors)
				local theme = colors.theme
				local c = require("kanagawa.lib.color")

				-- Floating windows
				local float_bg = "none"
				return {
					StatusLine = { bg = "NONE" },
					NormalFloat = { bg = float_bg },
					FloatBorder = { bg = float_bg },
					FloatTitle = { bg = float_bg },

					-- Popup menu
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					-- Telescope
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

					-- Diagnostics with subtle bg tint
					DiagnosticVirtualTextHint = {
						fg = theme.diag.hint,
						bg = c(theme.diag.hint):blend(theme.ui.bg, 0.95):to_hex(),
					},
					DiagnosticVirtualTextInfo = {
						fg = theme.diag.info,
						bg = c(theme.diag.info):blend(theme.ui.bg, 0.95):to_hex(),
					},
					DiagnosticVirtualTextWarn = {
						fg = theme.diag.warning,
						bg = c(theme.diag.warning):blend(theme.ui.bg, 0.95):to_hex(),
					},
					DiagnosticVirtualTextError = {
						fg = theme.diag.error,
						bg = c(theme.diag.error):blend(theme.ui.bg, 0.95):to_hex(),
					},
				}
			end,
		})

		-- Apply the colorscheme
		vim.cmd("colorscheme kanagawa")
	end,
}
