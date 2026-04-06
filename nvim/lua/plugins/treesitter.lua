return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install { 'c', 'cpp', 'go', 'lua', 'python', 'vimdoc', 'vim', 'bash', 'cmake', 'json', 'yaml', 'nu', 'typescript', 'svelte' }
        require('nvim-treesitter').setup {}
    end
}
