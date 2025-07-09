" lualine

lua << END
local win_width = vim.api.nvim_win_get_width(0) -- ウィンドウ幅

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        icon = '',
        padding = { left = 0, right = 1 },
        fmt = function(branch_name)
          if not branch_name or branch_name == '' then
            return ''
          end

          if win_width > 100 then
            return ' ' .. branch_name
          else
            return ''
          end

          return branch_name
        end,
      },
      {
        'diff',
        --symbols = { added = ' ', modified = ' ', removed = ' ' },
        symbols = { added = '➕ ', modified = '✏️ ', removed = '❌ ' },
        padding = { left = 0, right = 1 },
        fmt = function(str)
          if win_width > 90 then
            return str
          else
            return str:gsub('%d+', '') -- 数字を削除してアイコンのみを返す
          end
        end,
      },
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END
