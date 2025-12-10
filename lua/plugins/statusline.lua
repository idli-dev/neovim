return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lsp_symbols = {
      spinner = { '󰑓' },
      done = '',
      separator = ',',
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },

        -- center
        lualine_c = {
          {
            'filename',
            path = 1,
            shorting_target = 40,
            color = { gui = 'bold' },
          }
        },

        lualine_x = { 'filetype' },
        lualine_y = {
          {
            'lsp_status',
            symbols = lsp_symbols,
            ignore_lsp = {},
            show_name = true,
            padding = { left = 0, right = 1 },
            color = { gui = 'bold' },
          }
        },
        lualine_z = {
          { 'location', padding = { left = 0, right = 1 } }
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end
}
