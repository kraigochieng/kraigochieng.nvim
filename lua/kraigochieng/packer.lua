local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Icons 
    use 'nvim-tree/nvim-web-devicons'

    -- Nvim Telescope
    use {  
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.3',
        requires = { 
            {'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
            }
        } 
    }
    
    -- Rose Pine
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- The configurations are set here also so that when I uppate my packages, the color scheme remains
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })	
            vim.cmd('colorscheme rose-pine')
        end
    }

    --[[     use 'sainnhe/sonokai' ]]
    
--[[     use 'Mofiqul/dracula.nvim' ]]
    -- Nvim Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' },
        require = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        }
    }

    use {
        'nvim-treesitter/playground'
    }

    -- Git Plugins
    use 'tpope/vim-fugitive'

    -- LSP
    use	{
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim' },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            --      { 'j-hui/fidget.nvim', tag = 'legacy' },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    }

    use {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },

    }
    -- Auto Pairs of brackets and quotations
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('nvim-autopairs').setup {}
        end
    }

    -- For automatic tags in HTML/XML
    use 'windwp/nvim-ts-autotag'

    -- For multifile find and replace in a project
    use 'nvim-pack/nvim-spectre'
    
    -- To get a summary of projects in terms of functions, variables, classes, properties, methods e.t.c 
    use 'preservim/tagbar'

    -- Comments
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring' 

    -- File Tree
    use {
        'nvim-tree/nvim-tree.lua',
        after = 'nvim-web-devicons',
        requires = 'nvim-tree/nvim-web-devicons'
    }


    -- Indenting
    use 'lukas-reineke/indent-blankline.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }

    }

    -- Auto Save feature
    use 'Pocco81/auto-save.nvim'
    
    -- Buffer Line, this is what appears as tabs
    -- use {
    --     'akinsho/bufferline.nvim',
    --     tag = '*',
    --     requires = 'nvim-web-devicons' 
    -- }

    use 'lewis6991/gitsigns.nvim'

    use 'christoomey/vim-tmux-navigator'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'MunifTanjim/prettier.nvim'

use 'mfussenegger/nvim-jdtls'
    -- This should always be at the end of the file
    if packer_bootstrap then
        require('packer').sync()
    end

end)
