vim.keymap.set('n', '<leader>tG', function ()
  vim.api.nvim_command("LazyGit")
end, { desc = '[T]oggle Lazy[G]it' })


return {
  "kdheepak/lazygit.nvim"
}
