local ui = ':lua require("harpoon.ui")'
local mark = ':lua require("harpoon.mark")'

-- Toggle harpoon menu
vim.keymap.set('n', '<leader>ht', ui .. '.toggle_quick_menu()<cr>')
-- Add file to harpoon
vim.keymap.set('n', '<leader>ha', mark .. '.add_file()<cr>')
--Remove file from harpoon
vim.keymap.set('n', '<leader>hr', mark .. '.rm_file()<cr>')
-- Cycle Through Harpooned files
vim.keymap.set('n', '<leader>hp', ui .. '.nav_prev()<cr>')
vim.keymap.set('n', '<leader>hn', ui .. '.nav_next()<cr>')

require("harpoon").setup {
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    }
    -- projects = {
    -- -- Yes $HOME works
    -- ["$HOME/personal/vim-with-me/server"] = {
    --     term = {
    --         cmds = {
    --             "./env && npx ts-node src/index.ts"
    --         }
    --     }
    -- }
    -- }
}
