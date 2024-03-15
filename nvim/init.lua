vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
}, {})

vim.cmd.colorscheme 'dragon'

vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.shiftwidth = 4
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.splitbelow = 1
vim.o.splitright = 1
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.whichwrap = "h,l,<,>"
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.listchars="eol:↲,tab:▸-,trail:~,extends:→,precedes:←,space:."
vim.o.list = true
vim.o.conceallevel = 0

vim.g.nord_borders = true
vim.g.nord_italic = false

vim.keymap.set('n', '<leader>tn', ":tabnew<CR>", { desc = '[T]ab [n]ew' })
vim.keymap.set('n', '<leader>td', ":tabclose<CR>", { desc = '[T]ab [d]elte' })
vim.keymap.set('n', '<leader>to', ":tabonly<CR>", { desc = '[T]ab [o]only' })
vim.keymap.set('n', '<leader>]', ":tabnext<CR>", { desc = 'Tab next' })
vim.keymap.set('n', '<leader>[', ":tabprevious<CR>", { desc = 'Tab previous' })
vim.keymap.set('n', '<M-]>', ":tabnext<CR>", { desc = 'Tab next' })
vim.keymap.set('n', '<M-[>', ":tabprevious<CR>", { desc = 'Tab previous' })
vim.keymap.set('n', '<leader>}', ":tablast<CR>", { desc = 'Tab last' })
vim.keymap.set('n', '<leader>{', ":tabfirst<CR>", { desc = 'Tab first' })
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', '<leader>tb', function ()
  if vim.o.background == 'dark' then
    print("switched to light")
    vim.cmd('set background=light')
  else
    print("switched to dark")
    vim.cmd('set background=dark')
  end
end, { desc = '[T]oggle [b]ackground color (light/dark)' })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

pcall(function ()
  vim.fn.serverstart('/tmp/nvim.pipe')
end)

