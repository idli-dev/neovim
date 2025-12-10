return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "<leader>e", ":Oil --float<CR>", desc = "Open Oil File Explorer" }
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      watch_for_changes = false,
      keymaps = {
        ["<Esc><Esc>"] = { "actions.close", mode = "n" },
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        border = nil,
      },

    })
  end
}
