return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'williamboman/mason.nvim',
        'leoluz/nvim-dap-go',
        'nvim-neotest/nvim-nio',
        'Shatur/neovim-tasks',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        local getTargetExe = function()
            local ProjectConfig = require('tasks.project_config')
            local projectConfig = ProjectConfig:new()
            local cmake_utils = require('tasks.cmake_utils.cmake_utils')
            local module_config = projectConfig.cmake
            local build_dir = cmake_utils.getBuildDirFromConfig(module_config)
            local target_path = cmake_utils.getExecutablePath(build_dir, module_config.target,
                cmake_utils.getCurrentBuildType(module_config), cmake_utils.getReplyDir(build_dir))
            return target_path.filename
        end

        dap.adapters.lldb = {
            name = 'lldb',
            type = 'server',
            port = "${port}",
            executable = {
                command = 'codelldb',
                args = { "--port", "${port}" },
            },
        }
        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = getTargetExe,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                initCommands = function()
                    local commands = {}
                    table.insert(commands, "breakpoint name configure --disable cpp_exception")
                    -- local py   = vim.fn.expand("~/lldb-qt-formatters/QtFormatters.py")
                    -- local lldb = vim.fn.expand("~/lldb-qt-formatters/QtFormatters.lldb")
                    -- if vim.fn.filereadable(py) then
                    --     table.insert(commands, "command script import " .. py)
                    --     table.insert(commands, "command source " .. lldb)
                    -- end
                    return commands
                end
            },
        }

        -- dap.adapters.python = {
        --     type = 'executable',
        --     command = '/Users/jurica.bacurin/.local/share/nvim/mason/packages/debugpy/venv/bin/python',
        --     args = { '-m', 'debugpy.adapter' },
        -- }

        vim.fn.sign_define('DapStopped', { text = '󰏤', texthl = '', linehl = '', numhl = '' })

        require('dap-go').setup()

        vim.keymap.set('n', '<F5>', dap.continue)
        vim.keymap.set('n', '<F2>', dap.step_into)
        vim.keymap.set('n', '<F3>', dap.step_over)
        vim.keymap.set('n', '<F4>', dap.step_out)
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
        vim.keymap.set('n', '<leader>B', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end)

        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '󰏤',
                    play = '▶',
                    step_into = '',
                    step_over = '',
                    step_out = '',
                    step_back = '',
                    run_last = '',
                    terminate = '󰓛',
                },
            },
        }

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
