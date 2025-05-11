return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
        'folke/neodev.nvim',
    },
    config = function()
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

        vim.diagnostic.config({
            float = {
                source = 'always',
                border = "single"
            },
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = 'LSP: ' .. desc
                    end
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
                end
                local is_clangd = function()
                    for _, client in pairs(vim.lsp.get_active_clients { bufnr = event.buf }) do
                        if client.name == "clangd" then
                            return true
                        end
                        return false
                    end
                end
                if is_clangd() then
                    local sw = require('lspconfig.configs.clangd').commands.ClangdSwitchSourceHeader[1]
                    nmap('<F4>', sw, 'F4 - switch source/header')
                end
                nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
                nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                nmap('<leader>Ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                nmap('<leader>Wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
                nmap('<leader>Wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
                nmap('<leader>Wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, '[W]orkspace [L]ist Folders')

                vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
                    vim.lsp.buf.format()
                end, { desc = 'Format current buffer with LSP' })
                nmap('<leader>df', vim.lsp.buf.format, 'LSP: format document')
            end,
        })

        local servers = {
            clangd = {
            },
            rust_analyzer = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = { disable = { 'missing-fields' } },
                },
            },
        }

        require('neodev').setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        require('mason').setup()
        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        require('lspconfig').nushell.setup({
            cmd = { "nu", "--lsp" },
            filetypes = { "nu" },
            root_dir = require("lspconfig.util").find_git_ancestor,
            single_file_support = true,
        })

    --     local lspconfig = require 'lspconfig'
    --     local configs = require 'lspconfig.configs'
    --     if not configs.qml6_lsp then
    --       configs.qml6_lsp = {
    --         default_config = {
    --           cmd = {'/home/jb/Qt/6.7.0/gcc_64/bin/qmlls'},
    --           filetypes = {'qml'},
    --           root_dir = function(fname)
    --             return lspconfig.util.find_git_ancestor(fname)
    --           end,
    --           settings = {},
    --         },
    --       }
    --     end
    --     lspconfig.qml6_lsp.setup{}
    end
}
