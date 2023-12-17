return {
    'akinsho/bufferline.nvim', 
    version = "1.*", 
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        require'bufferline'.setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree"
                    }
                }
            }
        })
    end
}
