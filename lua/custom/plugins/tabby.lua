vim.o.showtabline = 2

vim.keymap.set('n', '<leader>tn', ":tabnew<CR>", { desc = '[T]ab [n]ew' })
vim.keymap.set('n', '<leader>td', ":tabclose<CR>", { desc = '[T]ab [d]elte' })
vim.keymap.set('n', '<leader>to', ":tabonly<CR>", { desc = '[T]ab [o]only' })
vim.keymap.set('n', '<leader>]', ":tabnext<CR>", { desc = 'Tab next' })
vim.keymap.set('n', '<leader>[', ":tabprevious<CR>", { desc = 'Tab previous' })
vim.keymap.set('n', '<leader>}', ":tablast<CR>", { desc = 'Tab next' })
vim.keymap.set('n', '<leader>{', ":tabfirst<CR>", { desc = 'Tab previous' })

return {
  'nanozuki/tabby.nvim',
  config = function ()
    local theme = {
      fill = 'TabLineFill',
      -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
      head = 'TabLine',
      current_tab = 'TabLineSel',
      tab = 'TabLine',
      win = 'TabLine',
      tail = 'TabLine',
    }
    require('tabby.tabline').set(function(line)
      local segments = vim.split(vim.fn.getcwd(), '/')
      local dirName = segments[#segments]
    return {
        {
          {" "},
          dirName,
          {"  "},
          vim.fn.expand('%:t'),
          {' '}
        },
        line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          {' '},
          tab.number(),
          {' '},
          hl = hl
        }
      end),
      line.spacer(),
      hl = theme.fill,
      }
    end)
  end
}
