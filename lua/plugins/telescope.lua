return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", "%.git/", "%.cache", "%.themes" },
      },
      extensions = { ["ui-select"] = themes.get_dropdown({}) },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader>fd", function()
      builtin.find_files({ prompt_title = "Dotfiles", cwd = "~/dotfiles", hidden = true })
    end, opts)

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ prompt_title = "Neovim Config", cwd = "~/.config/nvim", hidden = true })
    end, opts)

    vim.keymap.set("n", "<leader>fN", function()
      builtin.live_grep({ prompt_title = "Grep Neovim Config", cwd = "~/.config/nvim" })
    end, opts)

    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, opts)
    vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
    vim.keymap.set("n", "<leader>fs", builtin.grep_string, opts)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
  end,
}
