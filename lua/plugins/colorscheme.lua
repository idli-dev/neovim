return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  config = function()
    require("kanagawa").setup({
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false,
      terminalColors = true,
      theme = "wave",

      background = {
        dark = "wave",
        light = "lotus",
      },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        local c = require("kanagawa.lib.color")

        return {
          -- Floating windows
          NormalFloat                = { bg = "NONE" },
          FloatBorder                = { fg = theme.ui.special },
          FloatTitle                 = { bg = "NONE" },

          -- Statusline
          StatusLine                 = { bg = "NONE" },

          -- Blink completion menu
          BlinkCmpMenu               = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          BlinkCmpMenuBorder         = { fg = theme.ui.special, bg = "NONE" },
          BlinkCmpMenuSelection      = { fg = "NONE", bg = theme.ui.bg_p2 },
          BlinkCmpLabel              = { fg = theme.ui.fg_dim },
          BlinkCmpLabelDeprecated    = { fg = theme.syn.comment, italic = true },
          BlinkCmpLabelDetail        = { fg = theme.ui.fun },
          BlinkCmpKind               = { fg = theme.syn.type },
          BlinkCmpKindFunction       = { fg = theme.syn.func },
          BlinkCmpKindVariable       = { fg = theme.syn.variable },
          BlinkCmpKindClass          = { fg = theme.syn.class },
          BlinkCmpKindModule         = { fg = theme.syn.module },

          -- Telescope
          TelescopeTitle             = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal      = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder      = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal     = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder     = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal     = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder     = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- Diagnostics with subtle blended background tints
          DiagnosticVirtualTextHint  = { fg = theme.diag.hint, bg = c(theme.diag.hint):blend(theme.ui.bg, 0.95):to_hex() },
          DiagnosticVirtualTextInfo  = { fg = theme.diag.info, bg = c(theme.diag.info):blend(theme.ui.bg, 0.95):to_hex() },
          DiagnosticVirtualTextWarn  = { fg = theme.diag.warning, bg = c(theme.diag.warning):blend(theme.ui.bg, 0.95):to_hex() },
          DiagnosticVirtualTextError = { fg = theme.diag.error, bg = c(theme.diag.error):blend(theme.ui.bg, 0.95):to_hex() },
        }
      end,
    })

    vim.cmd("colorscheme kanagawa")
  end,
}
