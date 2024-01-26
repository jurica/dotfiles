return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

            vim.keymap.set('n', '<leader>Gs', require('telescope.builtin').git_status, { desc = '[G]it [s]tatus' })
            vim.keymap.set('n', '<leader>GS', require('telescope.builtin').git_stash, { desc = '[G]it [S]tash' })
            vim.keymap.set('n', '<leader>Gc', require('telescope.builtin').git_commits, { desc = '[G]it [c]ommits' })
            vim.keymap.set('n', '<leader>GC', require('telescope.builtin').git_bcommits,
                { desc = '[G]it file [C]ommits' })
            vim.keymap.set('n', '<leader>Gb', require('telescope.builtin').git_branches, { desc = '[G]it [b]ranches' })

            vim.keymap.set('n', '<leader>df', require('telescope.builtin').filetypes, { desc = '[D]ocument [f]iletype' })

            pcall(require('telescope').load_extension, 'fzf')

            vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
                { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader><space>', function()
                local function mapping(prompt_bufnr, map)
                    local delete_buf = function()
                        local selection = require('telescope.actions.state').get_selected_entry()
                        require('telescope.actions').close(prompt_bufnr)
                        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                        require('telescope.builtin').buffers { attach_mappings = mapping }
                    end
                    map('i', '<C-x>', delete_buf)
                    return true
                end
                require('telescope.builtin').buffers { attach_mappings = mapping }
            end, { desc = '[ ] Find existing buffers' })

            vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find,
                { desc = '[/] Fuzzily search in current buffer' })
            vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
                { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sG', function()
                require('telescope.builtin').live_grep {
                    search_dirs = { "%:p" },
                }
            end, { desc = '[S]earch by Grep in [F]ile' })
            vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics,
                { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = '[S]earch [J]umplist' })
            vim.keymap.set('n', '<leader>sm', require('telescope.builtin').marks, { desc = '[S]earch [M]arks' })
            vim.keymap.set('n', '<leader>st', require('telescope-tabs').list_tabs, { desc = '[S]earch [T]abs' })
            vim.keymap.set('n', '<leader>sc', require('telescope.builtin').colorscheme, { desc = '[S]earch [C]olorscheme' })


            require('telescope').setup {
                defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        vertical = {
                            width = 0.9,
                            mirror = true,
                            prompt_position = "top",
                        },
                        horizontal = {
                            width = 0.9,
                            prompt_position = "top",
                            preview_width = 0.6
                        },
                    },
                },
            }
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    {
        'LukasPietzschmann/telescope-tabs',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('telescope-tabs').setup()
        end
    },
}
