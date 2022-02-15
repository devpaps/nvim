local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format
keymap("n", "<C-f>", "<CMD>lua vim.lsp.buf.formatting_sync()<CR>", {noremap = true})

-- Better window movment
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Keep visual mode indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
keymap("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>", { noremap = true })
keymap("n", "<S-p>", "<CMD>Telescope live_grep<CR>", { noremap = true })

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", { noremap = true, silent = true })

-- Find word/file across project
keymap("n", "<Leader>pf", "yiw<CMD>Telescope git_files<CR><C-r>+<ESC>", { noremap = true })
keymap("n", "<Leader>pw", "<CMD>Telescope grep_string<CR><ESC>", { noremap = true })

-- Git
keymap("n", "<Leader>gla", "<CMD>lua require('plugins.telescope').my_git_commits()<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>glc", "<CMD>lua require('plugins.telescope').my_git_bcommits()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
keymap("n", "gn", ":bn<CR>", { noremap = true, silent = true })
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
keymap("n", "gp", ":bp<CR>", { noremap = true, silent = true })
keymap("n", "<S-q>", ":BufferClose<CR>", { noremap = true, silent = true })

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<Space>2", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<Space>3", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<Space>4", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<Space>5", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<Space>6", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<Space>7", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<Space>8", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<Space>9", ":BufferGoto 9<CR>", { silent = true })
keymap("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true })
keymap("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true })
keymap("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true })
keymap("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true })
keymap("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true })
keymap("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true })
keymap("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true })
keymap("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true })
keymap("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true })

-- Don't yank on delete char
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("v", "x", '"_x', { noremap = true, silent = true })
keymap("v", "X", '"_X', { noremap = true, silent = true })

-- Don't yank on visual paste
keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", { silent = true })
keymap("n", "<Space>.", ":cn<CR>", { silent = true })

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { silent = true })
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
end

-- LSP
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
