return {
    'Shatur/neovim-tasks',
    config = function()
        local function selectPreset()
            local cmake_presets = require('tasks.cmake_utils.cmake_presets')
            local availablePresets = cmake_presets.parse('buildPresets')

            vim.ui.select(availablePresets, { prompt = 'Select build preset' }, function(choice, idx)
                if not idx then
                    return
                end
                local ProjectConfig = require('tasks.project_config')
                local projectConfig = ProjectConfig:new()
                if not projectConfig['cmake'] then
                    projectConfig['cmake'] = {}
                end

                projectConfig['cmake']['build_preset'] = choice

                -- autoselect will invoke projectConfig:write()
                local cmake_utils = require('tasks.cmake_utils.cmake_utils')
                cmake_utils.autoselectConfigurePresetFromCurrentBuildPreset(projectConfig)
            end)
        end

        vim.keymap.set("n", "<leader>cp", selectPreset, { silent = true })
        vim.keymap.set("n", "<leader>ct", [[:Task set_module_param cmake target<cr>]], { silent = true })
        vim.keymap.set("n", "<leader>cc", [[:Task start cmake configure<cr>]], { silent = true })
        vim.keymap.set("n", "<leader>cb", [[:Task start cmake build<cr>]], { silent = true })
        vim.keymap.set("n", "<leader>cr", [[:Task start cmake run<cr>]], { silent = true })
        vim.keymap.set("n", "<leader>cd", [[:Task start cmake debug<cr>]], { silent = true })
        vim.keymap.set("n", "<C-c>", [[:Task cancel<cr>]], { silent = true })

        require('tasks').setup({
            default_params = {
                cmake = {
                    restart_clangd_after_configure = false,
                },
            },
            dap_open_command = function() return require('dap').continue() end,
        })
    end
}
