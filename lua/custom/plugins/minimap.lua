vim.keymap.set('n', '<leader>tm', function ()
  vim.api.nvim_command("MinimapToggle")
end, { desc = '[T]oggle [M]inimap' })

return {
  "wfxr/minimap.vim",
  config = function ()
    vim.g.minimap_width=15
    vim.g.minimap_git_colors=1
    vim.g.minimap_auto_start=1
    vim.g.minimap_auto_start_win_enter=1
  end
}
