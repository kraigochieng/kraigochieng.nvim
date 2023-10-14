-- Cursor Style for different modes
local normal_cursor = "n:block-nCursor-blinkwait300-blinkon200-blinkoff150"
local insert_cursor = "i:ver25-blinkwait300-blinkon200-blinkoff150"
local visual_cursor = "v:hor20-blinkwait300-blinkon200-blinkoff150"
vim.opt.guicursor = normal_cursor .. "," .. insert_cursor ..  "," .. visual_cursor

-- Cursor Colour
-- vim.api.nvim_set_hl(0, "Cursor", {fg = "#c4a7e7", bg="#31748f"})
-- vim.api.nvim_set_hl(0, "CursorReset", {fg = "#c4a7e7", bg="#31748f"})

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true;
-- Relative Line number highlighting
-- vim.cmd([[
-- " hi clear CursorLine
-- highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
-- " highlight CursorLineNr cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=NONE guifg=NONE
-- set cursorline
-- ]])
-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Adding lines at end of file
vim.opt.scrolloff = 2

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Helps with autocompletetion
vim.o.completeopt = 'menuone,noselect'

-- Save undo history
vim.o.undofile = true

-- Enable mouse mode 
vim.o.mouse = 'a'

-- Setup system and nvim clipboard to be similar
vim.o.clipboard = 'unnamedplus'

vim.opt.foldmethod = 'manual'

-- Autosave buffers
vim.opt.autowriteall = true
