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
    dependencies = {
        'Shatur/neovim-tasks',
    },
    config = function()
        local Path = require('plenary.path')
        local ProjectConfig = require('tasks.project_config')

        local function cmakeStatus()
            local cmake_config = ProjectConfig:new()['cmake']
            local cmakelists_dir = cmake_config.source_dir and cmake_config.source_dir or vim.loop.cwd()
            if (Path:new(cmakelists_dir) / 'CMakeLists.txt'):exists() then
                local cmake_utils = require('tasks.cmake_utils.cmake_utils')

                if cmake_utils.shouldUsePresets(cmake_config) then
                    local preset = cmake_config.build_preset or 'not selected'
                    local cmakeTarget = cmake_config.target and cmake_config.target or 'all'

                    return 'CMake preset: ' .. preset .. ', target: ' .. cmakeTarget
                else
                    local cmakeBuildType = cmake_config.build_type or 'not selected'
                    local cmakeKit = cmake_config.build_kit or 'not selected'
                    local cmakeTarget = cmake_config.target or 'all'

                    return 'CMake variant: ' .. cmakeBuildType .. ', kit: ' .. cmakeKit .. ', target: ' .. cmakeTarget
                end
            else
                return ''
            end
        end
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
                lualine_c = { { 'diagnostics', always_visible = true }, cmakeStatus },
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
