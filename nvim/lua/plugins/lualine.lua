local function format_mode(str)
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return str
    else
        return str .. "(recording @" .. recording_register .. ")"
    end
end

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '',
                section_separators = '',
                ignore_focus = { 'dap-repl' },
                disabled_filetypes = {
                    "dapui_watches", "dapui_breakpoints",
                    "dapui_scopes", "dapui_console",
                    "dapui_stacks", "dap-repl"
                },
            },
            winbar = {
                -- lualine_a = { { 'mode', fmt = format_mode } },
                -- lualine_b = { 'branch', { 'diff', colored = false } },
                lualine_b = { { 'filename', path = 1 } },
                -- lualine_c = { { 'filename', path = 1 } },
                -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
                -- lualine_y = { 'progress' },
                -- lualine_z = { 'location' }
            },
            sections = {
                lualine_a = { { 'mode', fmt = format_mode } },
                lualine_b = { 'branch', { 'diff', colored = false } },
                lualine_c = { { 'diagnostics', always_visible = true } },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_winbar = {
                lualine_c = { { 'filename', path = 1 } },
            },
            inactive_sections = {
                lualine_c = { { 'filename', path = 1 } },
            },
        })
    end,
}
