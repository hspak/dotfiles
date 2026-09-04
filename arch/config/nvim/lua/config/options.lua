vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- None of the configured plugins use Neovim's legacy remote-plugin hosts.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.number = true
vim.opt.title = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.virtualedit = "all"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.list = true
vim.opt.shortmess:append('I')

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
