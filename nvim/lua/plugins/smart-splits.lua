
return {
  'mrjones2014/smart-splits.nvim',
  config = function ()
    vim.keymap.set('n', '<M-h>', require('smart-splits').move_cursor_left, { desc = 'Move focus left'})
    vim.keymap.set('n', '<M-j>', require('smart-splits').move_cursor_down, { desc = 'Move focus down'})
    vim.keymap.set('n', '<M-k>', require('smart-splits').move_cursor_up, { desc = 'Move focus up'})
    vim.keymap.set('n', '<M-l>', require('smart-splits').move_cursor_right, { desc = 'Move focus right'})
    vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left, { desc = 'Resize left'})
    vim.keymap.set('n', '<C-j>', require('smart-splits').resize_down, { desc = 'Resize down'})
    vim.keymap.set('n', '<C-k>', require('smart-splits').resize_up, { desc = 'Resize up'})
    vim.keymap.set('n', '<C-l>', require('smart-splits').resize_right, { desc = 'Resize right'})
  end
}
