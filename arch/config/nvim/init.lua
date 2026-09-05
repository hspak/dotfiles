if vim.fn.has("nvim-0.12") == 0 then
  vim.notify("These dotfiles require Neovim >= 0.12. Run setup --install-packages.", vim.log.levels.ERROR)
  return
end

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
