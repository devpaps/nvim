local icons = require("icons")

-- Themes available is gruvbox and nordfox

M42 = {
  icons = icons,
  colorscheme = 'kanagawa',
    ui = {
    float = {
      border = 'rounded',
      highlight = 'kanagawa' -- check available by :Telescope highlights
    },
    background = {
      guifg = "#488DFF"
    },
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    }
  }
}
