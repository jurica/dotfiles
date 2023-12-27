vim.keymap.set('n', '<leader>tg', function ()
  vim.api.nvim_command("LazyGit")
end, { desc = '[T]oggle Lazy[g]it' })


return {
  "kdheepak/lazygit.nvim"
}
