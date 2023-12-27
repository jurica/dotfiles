return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                ["<leader>v"] = "actions.select_vsplit",
                ["<leader>s"] = "actions.select_split",
                ["<leader>p"] = "actions.preview",
                ["<leader>r"] = "actions.refresh",
                ["<leader>t"] = "actions.select_tab",
            }
        })
        vim.keymap.set('n', '<leader>tt', function()
            vim.api.nvim_command("Oil")
        end, { desc = '[T]oggle Filetree' })

        local noFile = true
        for _, buffer in ipairs(vim.fn.getbufinfo()) do
            if string.len(buffer.name) ~= 0 then
                noFile = false
                break
            end
        end
        if noFile then
            vim.api.nvim_command('Oil')
        end
    end
}
