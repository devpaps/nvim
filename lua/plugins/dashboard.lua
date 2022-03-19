local icons = M42.icons

vim.g.dashboard_custom_header = {
"  ooooooooo                                                                           ",
"   888    88o  ooooooooo8 oooo   oooo ooooooooo     ooooooo  ooooooooo    oooooooo8   ",
"   888    888 888oooooo8   888   888   888    888   ooooo888  888    888 888ooooooo   ",
"   888    888 888           888 888    888    888 888    888  888    888         888  ",
"  o888ooo88     88oooo888     888      888ooo88    88ooo88 8o 888ooo88   88oooooo88   ",
"                                       o888                   o888                    "
}

local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
vim.g.dashboard_session_directory = '~/.config/nvim/sessions'
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = {description = {icons.fileNoBg ..            'Find File          '}, command = 'Telescope find_files hidden=true'},
  b = {description = {icons.search ..              'Find Word          '}, command = 'Telescope live_grep'},
  c = {description = {icons.hexCutOut ..           'Recents            '}, command = 'Telescope oldfiles hidden=true'},
  d = {description = {icons.fileCopy ..            'Load Last Session  '}, command = 'SessionLoad'},
  e = {description = {icons.light ..               'Sync Plugins       '}, command = 'PackerSync'},
  f = {description = {icons.snippet ..             'Install Plugins    '}, command = 'PackerInstall'},
  g = {description = {icons.settings ..            'Settings           '}, command = 'edit $MYVIMRC'},
  h = {description = {icons.warningTriangle ..     'Exit               '}, command = 'exit'},
}
vim.g.dashboard_custom_footer = {icons.container .. plugins_count .. " plugins loaded" }
