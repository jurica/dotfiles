return {
    "yorickpeterse/nvim-window",
    config = function()
        vim.keymap.set('n', '<leader>w', function()
            require("nvim-window").pick()
        end, { desc = 'Pick [w]indow' })
    end
}
