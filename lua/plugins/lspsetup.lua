return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    { "j-hui/fidget.nvim",    opts = {} },
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  config = function()
    local mason_lsp = require("mason-lspconfig")

    mason_lsp.setup({
      ensure_installed = { "emmylua_ls" },
      automatic_enable = true,
    })

    -- LspAttach autocmd
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, silent = true }
        local map = vim.keymap.set
        local buf = vim.lsp.buf

        map('n', 'gd', buf.definition, opts)
        map('n', 'gD', buf.declaration, opts)
        map('n', 'grr', buf.references, opts)
        map('n', 'gi', buf.implementation, opts)
        map('n', 'grn', buf.rename, opts)
        map('n', 'gca', buf.code_action, opts)
        map('n', '<leader>cf', function() buf.format({ async = true }) end, opts)

        map('n', 'K', function()
          buf.hover({
            border = "rounded",
            max_width = 80,
            focusable = true,
          })
        end, opts)

        map('n', 'gl', function()
          vim.diagnostic.open_float(nil, {
            scope = "cursor",
            border = "single",
          })
        end, opts)
      end,
    })
  end,
}
