vim.keymap.set('n', '<leader>tt', function ()
  vim.api.nvim_command("Oil")
end, { desc = '[T]oggle Filetree' })

return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup({
      keymaps = {
        ["<leader>v"] = "actions.select_vsplit",
        ["<leader>s"] = "actions.select_split",
        ["<leader>p"] = "actions.preview",
        ["<leader>r"] = "actions.refresh",
        ["<leader>t"] = "actions.select_tab",
      }
    })
  end
}
