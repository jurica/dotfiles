vim.keymap.set('n', '<leader>zkn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = '[zk] [N]ew Note' })
vim.keymap.set('n', '<leader>zkj', "<Cmd>ZkNew { group = 'journal', dir = 'journal' }<CR>", { desc = '[zk] Open todays [J]ournal' })
vim.keymap.set('n', '<leader>zks', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = '[zk] [S]earch Notes' })
vim.keymap.set('n', '<leader>zka', "<Cmd>ZkNote<CR>", { desc = '[zk] [A]ll Notes' })
vim.keymap.set('n', '<leader>zkt', "<Cmd>ZkTag<CR>", { desc = '[zk] [T]ags' })
vim.keymap.set('n', '<leader>zkl', "<Cmd>ZkLinks<CR>", { desc = '[zk] [L]inks' })
vim.keymap.set('n', '<leader>zkb', "<Cmd>ZkBacklinks<CR>", { desc = '[zk] [B]acklinks' })
vim.keymap.set('n', '<leader>zkil', "<Cmd>ZkInsertLink<CR>", { desc = '[zk] [I]nsert [L]ink' })

return {
  'mickael-menu/zk-nvim',
  config = function ()
    require("zk").setup({
      picker = "telescope",
    })
  end
}
