vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    require('leap').init_highlight(true)
  end,
  pattern = '*',
})


return {
  "ggandor/leap.nvim",
  config = function ()
    require('leap').add_default_mappings()
  end
}
