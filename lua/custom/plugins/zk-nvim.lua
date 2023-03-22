vim.keymap.set('n', '<leader>zkn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = '[zk] [N]otes' })
vim.keymap.set('n', '<leader>zks', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = '[zk] [N]otes' })

return {
  'mickael-menu/zk-nvim',
  config = function ()
    require("zk").setup({
      picker = "telescope",
    })
  end
}
