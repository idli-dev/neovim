return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
  ---@type conform.setupOpts
  opts = {
    -- Filetype-specific formatters
    formatters_by_ft = {
      -- Web / frontend
      html = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier" },
      svelte = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },

      -- Backend / scripting
      lua = { "stylua" },
      rust = { "rustfmt" },

      -- Shell / CLI
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      -- Other
      jsonc = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      dockerfile = { "hadolint" },
    },

    -- Default formatting options
    default_format_opts = {
      lsp_format = "fallback",
    },

    -- Auto-format on save
    format_on_save = { timeout_ms = 500 },

    -- Formatter-specific options
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
      stylua = {
        append_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      prettier = {
        append_args = { "--single-quote", "--trailing-comma all" },
      },
      rustfmt = {},
    },
  },
}
