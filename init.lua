vim.cmd([[
    set mouse=
    set nu rnu
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set nowrap
    packadd packer.nvim
    colorscheme rose-pine
    nmap <silent> <Space>o <C-w>w
    inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm()
                                    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    let g:coc_rust_analyzer_rustup_toolchain = 'stable-x86_64-unknown-linux-gnu'
]])

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'rose-pine/neovim'
    use 'nvim-lua/plenary.nvim'
    use 'theprimeagen/harpoon'
    use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use{'neoclide/coc.nvim', branch = 'release'}
    use 'mhartington/formatter.nvim'
    use 'williamboman/mason.nvim'
end)
require 'nvim-treesitter.configs'.setup {
    sync_install = false,
    auto_install = true,
    highlight = { enable = true }
}
require("mason").setup()
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')


vim.g.mapleader = " "

vim.keymap.set("n", "<leader>t", vim.cmd.vs)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pq", function() mark.set_current_at(1) end)
vim.keymap.set("n", "<leader>pw", function() mark.set_current_at(2) end)
vim.keymap.set("n", "<leader>pe", function() mark.set_current_at(3) end)
vim.keymap.set("n", "<leader>p1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>p2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>p3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>e", vim.cmd.CocDiagnostics)
vim.keymap.set("n", "<leader>f", vim.cmd.Format)
