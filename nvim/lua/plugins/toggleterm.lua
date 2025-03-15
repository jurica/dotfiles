return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        local opts = {
            shade_terminals = false,
        }

        opts['shell'] = 'nu'

        vim.opt.shell = opts['shell']
        vim.opt.shellcmdflag = '-c'
        vim.opt.shellxquote = ''
        vim.opt.shellquote = ''

        require('toggleterm').setup(opts)

        vim.keymap.set('n', '<leader>ts', function()
            vim.api.nvim_command("ToggleTerm")
        end, { desc = '[T]oggle [S]hell' })

        vim.keymap.set('t', '<C-x>', "<C-\\><C-n>")
    end,
}
