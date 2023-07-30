return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'sainnhe/everforest'
    use 'EdenEast/nightfox.nvim'

    -- telescope fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- treesitter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        {run = ':TSUpdate'}
    }

end)
