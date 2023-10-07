-- Set Leader
vim.g.mapleader = " "

-- Netrw Open Tree
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Move Command shortcut that works on highlight
vim.keymap.set('v','J', ":m '<-2<CR>gv=gv")
vim.keymap.set('v','K', ":m '>+1<CR>gv=gv")

-- Map undo
vim.keymap.set('n', '<leader>u', ':u<cr>')
-- Map redo 
vim.keymap.set('n', '<leader>r', ':r<cr>')

-- Make system clipboard usable
-- Make what is highlighted to be pasted over
vim.keymap.set('x', '<leader>p', '\"_dP')


-- Allow for copying from nvim to system clipboard
-- vim.keymap.set('n', '<leader>y', '\"+y')
-- vim.keymap.set('v', '<leader>y', '\"+y')
-- vim.keymap.set('n', '<leader>Y', '\"+Y')


-- -- Moving through windows easily
vim.keymap.set('n', '<C-j>', '<C-w>h')
vim.keymap.set('n', '<C-k>', '<C-w>j')
vim.keymap.set('n', '<C-i>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
