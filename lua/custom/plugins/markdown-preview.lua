vim.keymap.set('n', '<leader>tp', function ()
  vim.api.nvim_command("MarkdownPreviewToggle")
end, { desc = '[T]oggle Markdown[P]review' })

return {
  "iamcco/markdown-preview.nvim",
  config = function ()
    vim.fn["mkdp#util#install"]()
    -- require('markdown:La
  end,
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
