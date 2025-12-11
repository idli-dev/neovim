return {
  "MeanderingProgrammer/harpoon-core.nvim",
  branch = "main",
  opts = {
    use_existing = true,
    mark_branch = true,
    use_cursor = true,
    menu = { icons = true, width = 0.5, height = 0.5 },
    delete_confirmation = false,
  },
  keys = function()
    local harpoon = require("harpoon-core")
    return {
      {
        "<leader>h",
        function()
          harpoon.add_file()
        end,
        desc = "Add Harpoon File",
      },
      {
        "<leader>H",
        ":Telescope harpoon-core marks<CR>",
        desc = "Harpoon Quick Menu",
      },
      {
        "<A-u>",
        function()
          harpoon.nav_file(1)
        end,
        desc = "Harpoon File 1",
      },
      {
        "<A-i>",
        function()
          harpoon.nav_file(2)
        end,
        desc = "Harpoon File 2",
      },
      {
        "<A-o>",
        function()
          harpoon.nav_file(3)
        end,
        desc = "Harpoon File 3",
      },
      {
        "<A-p>",
        function()
          harpoon.nav_file(4)
        end,
        desc = "Harpoon File 4",
      },
    }
  end,
  config = function(_, opts)
    require("harpoon-core").setup(opts)
  end,
}
