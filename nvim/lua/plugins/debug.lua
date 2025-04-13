return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'williamboman/mason.nvim',
        'leoluz/nvim-dap-go',
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        local codelldb = function ()
            return vim.fn.exepath('codelldb')
        end
        dap.adapters.lldb = {
            name = 'lldb',
            type = 'server',
            port = "${port}",
            executable = {
                -- command = vim.fn.exepath('codelldb'),
                -- command = '/Users/jurica.bacurin/.local/share/nvim/mason/bin/codelldb',
                -- command = '/home/jb/.local/share/nvim/mason/bin/codelldb',
                command = 'codelldb',
                args = { "--port", "${port}" },
            },
        }
        dap.configurations.cpp = {
            {
                name = 'Launch',
                type = 'lldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
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
        vim.api.nvim_create_user_command('SetDebuggee',
            function()
                local dap = require 'dap'
                dap.configurations.cpp[1].program = vim.fn.input('Path to debugee: ', vim.fn.getcwd() .. '/', 'file')
            end,
            { nargs = 0 }
        )
        vim.api.nvim_create_user_command('ResetDebuggee',
            function()
                local dap = require 'dap'
                dap.configurations.cpp = {
                    {
                        name = 'Launch',
                        type = 'lldb',
                        request = 'launch',
                        program = function()
                            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                        end,
                        cwd = '${workspaceFolder}',
                        stopOnEntry = false,
                        args = {},
                    },
                }
            end,
            { nargs = 0 }
        )
        vim.api.nvim_create_user_command('ShowDebuggee', function()
                vim.print("Current debuggee: ", dap.configurations.cpp[1].program)
            end,
            { nargs = 0 }
        )
        vim.api.nvim_create_user_command('DapLoadLldbForCpp',
            function() require('dap.ext.vscode').load_launchjs(vim.fn.getcwd() .. '/.vscode/launch.json',
                    { lldb = { 'cpp', } }) end, { nargs = 0 })

        dap.adapters.python = {
            type = 'executable',
            command = '/Users/jurica.bacurin/.local/share/nvim/mason/packages/debugpy/venv/bin/python',
            args = { '-m', 'debugpy.adapter' },
        }

        vim.fn.sign_define('DapStopped', { text = '󰏤', texthl = '', linehl = '', numhl = '' })

        require('dap-go').setup()

        vim.keymap.set('n', '<F5>', dap.continue)
        vim.keymap.set('n', '<F1>', dap.step_into)
        vim.keymap.set('n', '<F2>', dap.step_over)
        vim.keymap.set('n', '<F3>', dap.step_out)
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
