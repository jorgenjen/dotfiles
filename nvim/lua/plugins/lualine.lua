-- TO include @register for when a macro is recording
local function custom_mode()
  local mode = vim.fn.mode()
  local mode_map = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'V-LINE',
    [''] = 'V-BLOCK', -- <C-v>
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL'
  }

  -- Check if recording a macro and add it to the mapped mode
  local recording = vim.fn.reg_recording()
  if recording ~= '' then
    return mode_map[mode] .. ' @' .. recording
  end

  -- Return the mapped mode or raw mode (on char)
  return mode_map[mode] or mode
end


return {
  "nvim-lualine/lualine.nvim",

  options = {theme = "gruvbox"},
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        -- lualine_a = {'mode'},
        lualine_a = {custom_mode}, -- for recording macros information 
        lualine_b = {'branch', 'diff', 'diagnostics'},
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

  end
}
