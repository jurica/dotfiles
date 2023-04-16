vim.keymap.set('n', '<leader>ts', function ()
  vim.api.nvim_command("ToggleTerm")
end, { desc = '[T]oggle [S]hell' })

-- vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")

return {
  "akinsho/toggleterm.nvim",
  version = '*',
  config = true,
  opts = {
    shade_terminals = false,
  },
}
