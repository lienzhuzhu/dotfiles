return {
    'sainnhe/gruvbox-material',
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_enable_bold = true
        vim.cmd.colorscheme('gruvbox-material')
    end
}
