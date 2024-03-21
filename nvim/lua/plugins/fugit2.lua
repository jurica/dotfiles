return {
    'SuperBo/fugit2.nvim',
    opts = {},
    cmd = {'Fugit2', 'Fugit2Graph'},
    keys = {
        {'<leader>F', mode = 'n', '<cmd>Fugit2<cr>'}
    },
    dependencies = {
        'sindrets/diffview.nvim'
    }
}
