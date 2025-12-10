return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  config = function()
    local mason_lsp = require("mason-lspconfig")

    mason_lsp.setup({
      ensure_installed = { "emmylua_ls" },
      automatic_enable = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, silent = true }
        local map = vim.keymap.set
        local buf = vim.lsp.buf

        -- Go-to commands
        map("n", "<leader>ld", buf.definition, { desc = "LSP: Go to Definition", unpack(opts) })
        map("n", "<leader>lD", buf.declaration, { desc = "LSP: Go to Declaration", unpack(opts) })
        map("n", "<leader>li", buf.implementation, { desc = "LSP: Go to Implementation", unpack(opts) })
        map("n", "<leader>lt", buf.type_definition, { desc = "LSP: Go to Type Definition", unpack(opts) })
        map("n", "<leader>lr", buf.references, { desc = "LSP: List References", unpack(opts) })

        -- LSP actions
        map("n", "<leader>ln", buf.rename, { desc = "LSP: Rename Symbol", unpack(opts) })
        map("n", "<leader>la", buf.code_action, { desc = "LSP: Code Action", unpack(opts) })

        -- Formatting
        map("n", "<leader>lf", function()
          buf.format({ async = true })
        end, { desc = "LSP: Format Buffer", unpack(opts) })

        -- Hover & Diagnostics
        map("n", "K", function()
          local options = { scope = "cursor", border = "single", max_width = 80 }
          local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })

          if diagnostics and #diagnostics > 0 then
            vim.diagnostic.open_float(nil, options)
          else
            vim.lsp.buf.hover(options)
          end
        end, { desc = "LSP: Hover / Show Diagnostics", unpack(opts) })
      end,
    })
  end,
}
