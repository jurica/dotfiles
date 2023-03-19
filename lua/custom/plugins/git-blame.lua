return {
  "f-person/git-blame.nvim",
  config = function ()
    vim.g.gitblame_date_format = '%d.%m.%y %H:%M'
    vim.g.gitblame_message_template = '<author> • <date> • <summary>'
    vim.g.gitblame_display_virtual_text = 0
    local git_blame = require('gitblame')
    require('lualine').setup({
      sections = {
        lualine_c = {
          { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
        }
      }
    })
  end
}
