-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.whichwrap = "h,l,<,>"

vim.o.splitbelow = 1
vim.o.splitright = 1

vim.g.nord_borders = true
vim.g.nord_italic = false

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', '<leader>Gs', require('telescope.builtin').git_status, { desc = '[G]it [s]tatus' })
vim.keymap.set('n', '<leader>GS', require('telescope.builtin').git_stash, { desc = '[G]it [S]tash' })
vim.keymap.set('n', '<leader>Gc', require('telescope.builtin').git_commits, { desc = '[G]it [c]ommits' })
vim.keymap.set('n', '<leader>GC', require('telescope.builtin').git_bcommits, { desc = '[G]it file [C]ommits' })
vim.keymap.set('n', '<leader>Gb', require('telescope.builtin').git_branches, { desc = '[G]it [b]ranches' })

vim.keymap.set('n', '<leader>df', require('telescope.builtin').filetypes, { desc = '[D]ocument [f]iletype'})

vim.keymap.set('n', '<leader>tb', function ()
  -- print(vim.o.background)
  if vim.o.background == 'dark' then
    print("switched to light")
    vim.cmd('set background=light')
  else
    print("switched to dark")
    vim.cmd('set background=dark')
  end
end, { desc = '[T]oggle [b]ackground color (light/dark)' })

pcall(function ()
  vim.fn.serverstart('/tmp/nvim.pipe')
end)

return {}
