-- Disable the default tree (Netrw) 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    
    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings 
    vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<cr>', {})
   vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<cr>', {})

end

require('nvim-tree').setup({
    view = {
        adaptive_size = true 
    },
    on_attach = my_on_attach
})
