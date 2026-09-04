if vim.loader then
  vim.loader.enable()
end

vim.opt.termguicolors = true
vim.cmd.colorscheme("cinderwell")

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
require("config.lsp")
