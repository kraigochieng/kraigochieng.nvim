vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

local rosepine = require('rose-pine')

rosepine.setup {
    variant = 'moon',
    dark_variant = 'main',
--    disable_background = true,
    bold_vert_split = true,
}


vim.cmd('colorscheme rose-pine')
