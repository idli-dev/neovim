return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      },
      sync_install = true,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = "<cr>",
          node_decremental = "<bs>",
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = false,
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["<leader>tf"] = "@function.outer",
            ["<leader>tc"] = "@class.outer",
          },
          goto_previous_start = {
            ["<leader>tF"] = "@function.outer",
            ["<leader>tC"] = "@class.outer",
          },
        },
      },
    })
  end,
}
