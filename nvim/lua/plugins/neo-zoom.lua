return {
    "nyngwang/NeoZoom.lua",
    config = function()
        require('neo-zoom').setup{
            winopts = {
                offset = {
                    width = 1.0,
                    height = 1.0
                },
                border = 'rounded'
            }
        }
        vim.keymap.set('n', '<C-w>z', function () vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
    end
}
