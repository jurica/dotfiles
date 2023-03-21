return {
  'akinsho/bufferline.nvim',
  tag = "v3.5.0",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function ()
    require('bufferline').setup{
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = function()
              local segments = vim.split(vim.fn.getcwd(), '/')
              local dirName = segments[#segments]
              return dirName
            end,
            text_align = "left",
          }
        }
      },
    }
  end
}
