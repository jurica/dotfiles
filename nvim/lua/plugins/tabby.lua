return {
    'nanozuki/tabby.nvim',
    config = function()
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
                { "  " .. dirName .. " " },
                line.tabs().foreach(
                    function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            { ' ' .. tab.number() .. ' ' },
                            hl = hl
                        }
                    end
                ),
                line.spacer(),
                hl = theme.fill,
            }
        end)
    end
}
