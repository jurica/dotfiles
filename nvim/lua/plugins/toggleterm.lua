return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        local opts = {
            shade_terminals = false,
        }
        if os.getenv('OS') == 'Windows_NT' then
            opts['shell'] = 'pwsh.exe -NoLogo -ExecutionPolicy RemoteSigned'
            vim.opt.shell = opts['shell']
            vim.opt.shellcmdflag = '-Command'
            vim.opt.shellxquote = ''
            vim.opt.shellquote = ''
        end
        require('toggleterm').setup(opts)

        vim.keymap.set('n', '<leader>ts', function()
            vim.api.nvim_command("ToggleTerm")
        end, { desc = '[T]oggle [S]hell' })

        vim.keymap.set('t', '<C-x>', "<C-\\><C-n>")
    end,
}
