local icons = require("icons")

-- Themes available is gruvbox and nordfox

M42 = {
  icons = icons,
  colorscheme = 'gruvbox',
  ui = {
    float = {
      border = 'rounded',
      highlight = 'gruvbox' -- check available by :Telescope highlights
    },
    background = {
      guifg = "#488DFF"
    },
  },
  plugins = {
    completion = {
      select_first_on_enter = false
    },
    rooter = {
      -- Removing package.json from list in Monorepo Frontend Project can be helpful
      -- By that your live_grep will work related to whole project, not specific package
      patterns = { '.git', 'package.json', '_darcs', '.bzr', '.svn', 'Makefile' } -- Default
    },
  }
}
