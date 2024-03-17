return {
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
    },
    config = function ()
        require('gitsigns').setup{
            on_attach = function (bufnr)
                local gs = package.loaded.gitsigns
                vim.keymap.set('n', '<leader>gh', gs.next_hunk, { desc = "Go to next hunk" })
                vim.keymap.set('n', '<leader>gH', gs.prev_hunk, { desc = "Go to previous hunk" })
                vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = "Preview hunk" })
                vim.keymap.set('n', '<leader>D', gs.diffthis, { desc = "Show Diff" })
            end
        }
    end
}
