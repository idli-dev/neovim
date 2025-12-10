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

    -- Telescope setup
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",  -- ignore node_modules folder
          "%.git/",        -- ignore .git folder
          "%.cache",       -- ignore files ending with .cache
          "%.themes",      -- ignore .themes folder
        },
      },
      extensions = {
        ["ui-select"] = themes.get_dropdown({}),
      },
    })

    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")

    -- Custom functions
    local M = {}

    -- Search dotfiles including hidden files
    M.find_dotfiles = function()
      builtin.find_files({
        prompt_title = "Dotfiles",
        cwd = "~/dotfiles",
        hidden = true,
      })
    end

    -- Search Neovim config
    M.find_nvim = function()
      builtin.find_files({
        prompt_title = "Neovim Config",
        cwd = "~/.config/nvim",
        hidden = true,
      })
    end

    -- Live grep in Neovim config
    M.grep_nvim = function()
      builtin.live_grep({
        prompt_title = "Grep Neovim Config",
        cwd = "~/.config/nvim",
      })
    end

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>fd", M.find_dotfiles, vim.tbl_extend("force", opts, { desc = "Telescope: Find Dotfiles" }))
    vim.keymap.set("n", "<leader>fn", M.find_nvim, vim.tbl_extend("force", opts, { desc = "Telescope: Find Neovim Config" }))
    vim.keymap.set("n", "<leader>fN", M.grep_nvim, vim.tbl_extend("force", opts, { desc = "Telescope: Grep Neovim Config" }))
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, vim.tbl_extend("force", opts, { desc = "Telescope: Recently Opened Files" }))
    vim.keymap.set("n", "<leader>fs", builtin.grep_string, vim.tbl_extend("force", opts, { desc = "Telescope: Search String Under Cursor" }))
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, vim.tbl_extend("force", opts, { desc = "Telescope: Live Grep" }))
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, vim.tbl_extend("force", opts, { desc = "Telescope: Help Tags" }))
  end,
}

