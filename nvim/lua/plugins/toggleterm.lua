return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require('toggleterm').setup({
            shade_terminals = false,
        })

        vim.keymap.set('n', '<leader>ts', function()
            vim.api.nvim_command("ToggleTerm")
        end, { desc = '[T]oggle [S]hell' })

        vim.keymap.set('t', '<C-x>', "<C-\\><C-n>")
    end,
}
