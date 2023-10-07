-- Cursor Style for different modes
vim.opt.guicursor = "n:block-nCursor-blinkwait300-blinkon200-blinkoff150,i:ver25-blinkwait300-blinkon200-blinkoff150,v:hor20-blinkwait300-blinkon200-blinkoff150"

-- Cursor Colour
-- vim.api.nvim_set_hl(0, "Cursor", {fg = "#c4a7e7", bg="#31748f"})
-- vim.api.nvim_set_hl(0, "CursorReset", {fg = "#c4a7e7", bg="#31748f"})

-- Line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true;

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- Searching
vim.opt.hlsearch = true
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
