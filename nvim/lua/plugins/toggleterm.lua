return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        local opts = {
            shade_terminals = false,
        }
        if vim.fn.has('win32') then
            opts['shell'] = 'pwsh.exe'
            vim.opt.shell = 'pwsh.exe'
        end
        require('toggleterm').setup(opts)

        vim.keymap.set('n', '<leader>ts', function()
            vim.api.nvim_command("ToggleTerm")
        end, { desc = '[T]oggle [S]hell' })

        vim.keymap.set('t', '<C-x>', "<C-\\><C-n>")
    end,
}
