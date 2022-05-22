local icons = require("icons")

-- Themes available is gruvbox and nordfox

M42 = {
  icons = icons,
  colorscheme = 'gruvbox',
    ui = {
    float = {
      border = 'rounded',
      highlight = 'gruvbox' -- check available by :Telescope highlights
    }
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    }
  }
}
