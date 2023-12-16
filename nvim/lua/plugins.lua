return {

     'wbthomason/packer.nvim',

     'EdenEast/nightfox.nvim',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },

     'christoomey/vim-tmux-navigator',

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- image preview support
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

}
