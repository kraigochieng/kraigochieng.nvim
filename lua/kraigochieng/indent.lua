-- Enable filetype-specific indenting
vim.cmd('filetype plugin indent on')

-- Set the desired shiftwidth and tabstop for HTML files
vim.cmd('autocmd FileType html setlocal shiftwidth=4 tabstop=4')

-- Enable auto-indentation
vim.cmd('autocmd FileType html setlocal autoindent')

