return {
    'nvim-lualine/lualine.nvim',
    --'nvim-tree/nvim-web-devicons',
    config = function ()
        require('lualine').setup({
            options = {
                theme = 'dracula'
            }
        })
    end
}
