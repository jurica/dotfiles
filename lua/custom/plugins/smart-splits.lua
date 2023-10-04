
return {
  'mrjones2014/smart-splits.nvim',
  config = function ()
    vim.keymap.set('n', '<leader><Left>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<leader><Down>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<leader><Up>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<leader><Right>', require('smart-splits').move_cursor_right)
  end
}
