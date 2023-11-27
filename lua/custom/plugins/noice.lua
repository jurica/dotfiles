return {
  "folke/noice.nvim",
  config = function ()
    require('noice').setup({
      views = {
        cmdline_popup = {
          border = {
            style = "rounded",
            padding = { 0, 0 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },
    })
  end,
  -- dependencies = {
  --   'rcarriga/nvim-notify',
  --   config = function ()
  --     require('notify').setup({
  --       stages = "static"
  --     })
  --   end
  -- }
}
