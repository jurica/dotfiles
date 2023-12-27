
return {
  'mrjones2014/smart-splits.nvim',
  config = function ()
    vim.keymap.set('n', '<leader>h', require('smart-splits').start_resize_mode, { desc = '[h] Enter resize mode'})
    vim.keymap.set('n', '<leader><Left>', require('smart-splits').move_cursor_left, { desc = '[󰁍] move focus left'})
    vim.keymap.set('n', '<leader><Down>', require('smart-splits').move_cursor_down, { desc = '[󰁅] move focus down'})
    vim.keymap.set('n', '<leader><Up>', require('smart-splits').move_cursor_up, { desc = '[󰁝] move focus up'})
    vim.keymap.set('n', '<leader><Right>', require('smart-splits').move_cursor_right, { desc = '[󰁔] move focus right'})
    require('smart-splits').setup({
      resize_mode = {
        silent = true,
        hooks = {
          on_enter = function ()
            require('lualine').setup({
              sections = {lualine_a = {{
                function ()
                  return 'RESIZE'
                end
              }}},
              winbar = {lualine_a = {{
                function ()
                  return 'RESIZE'
                end
              }}}
            })
          end,
          on_leave = function ()
            require('lualine').setup({
              sections = {lualine_a = {'mode'}},
              winbar = {lualine_a = {'mode'}}
            })
          end
        }
      }
    })
  end
}
