return {
    "folke/noice.nvim",
    config = function()
        require('noice').setup({
            views = {
                cmdline_popup = {
                    border = {
                        style = "single",
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
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}
