
return {
  'mrjones2014/smart-splits.nvim',
  config = function ()
    vim.keymap.set('n', '<leader><Left>', require('smart-splits').resize_left)
    vim.keymap.set('n', '<leader><Down>', require('smart-splits').resize_down)
    vim.keymap.set('n', '<leader><Right>', require('smart-splits').resize_right)
    vim.keymap.set('n', '<leader><Up>', require('smart-splits').resize_up)
    vim.keymap.set('n', '<leader><leader><Left>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<leader><leader><Down>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<leader><leader><Up>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<leader><leader><Right>', require('smart-splits').move_cursor_right)
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
  end
}
