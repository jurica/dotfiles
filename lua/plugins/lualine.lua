return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local gitblame = require('gitblame')
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
                ignore_focus = { 'dap-repl' },
                disabled_filetypes = {
                    "dapui_watches", "dapui_breakpoints",
                    "dapui_scopes", "dapui_console",
                    "dapui_stacks", "dap-repl"
                },
            },
            winbar = {
                lualine_a = { 'mode' },
                lualine_b = { { 'filename', path = 1 } },
                lualine_c = { 'diagnostics' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            sections = {
                lualine_b = {
                    { 'branch' },
                    { 'diff' },
                    { gitblame.get_current_blame_text, cond = gitblame.is_blame_text_available }
                },
                lualine_c = { 'diagnostics' }
            },
            inactive_winbar = {
                lualine_b = { { 'filename', path = 1 } },
            },
            inactive_sections = {
                lualine_b = { { 'filename', path = 1 } },
                lualine_c = {},
                lualine_x = {},
            }
        })
    end,
    dependencies = {
        {
            "f-person/git-blame.nvim",
            config = function()
                vim.g.gitblame_date_format = '%d.%m.%y %H:%M'
                vim.g.gitblame_message_template = '<author> • <date> • <summary>'
                vim.g.gitblame_message_when_not_committed = 'Not Committed Yet'
                vim.g.gitblame_display_virtual_text = 0
                vim.g.gitblame_ignored_filetypes = { 'log', 'dump' }
            end,
        },
    },
}
