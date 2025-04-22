local telescope_pickers = require("telescope.pickers")
local telescope_finders = require("telescope.finders")
local telescope_config = require("telescope.config").values
local telescope_actions = require("telescope.actions")
local telescope_actions_state = require("telescope.actions.state")
local selector = function(items, callback)
    telescope_pickers.new({}, {
        prompt_title = "Quickfix",
        finder = telescope_finders.new_table(items),
        sorter = telescope_config.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            telescope_actions.select_default:replace(function()
                telescope_actions.close(prompt_bufnr)
                local selection = telescope_actions_state.get_selected_entry()
                callback(selection[1])
            end
            )
            return true
        end,
    }):find()
end

return {
    'brunobmello25/persist-quickfix.nvim',
    --- @type PersistQuickfix.Config
    opts = {
        selector = selector
    },
    init = function()
        local persist_quickfix = require 'persist-quickfix'
        vim.api.nvim_create_user_command('QuickfixDelete', function()
            persist_quickfix.choose_delete()
        end, {})

        vim.api.nvim_create_user_command('QuickfixLoad', function()
            persist_quickfix.choose()
        end, {})

        vim.api.nvim_create_user_command('QuickfixSave', function(args)
            if args.fargs[1] and args.fargs[1] ~= '' then
                persist_quickfix.save(args.fargs[1])
            else
                vim.ui.input({ prompt = 'Quickfix name: ' }, function(value)
                    if value then
                        persist_quickfix.save(value)
                    end
                end)
            end
        end, { nargs = '?' })

        vim.keymap.set('n', '<leader>qs', '<cmd>QuickfixSave<CR>')
        vim.keymap.set('n', '<leader>qd', '<cmd>QuickfixDelete<CR>')
        vim.keymap.set('n', '<leader>ql', '<cmd>QuickfixLoad<CR>')
    end,
}
