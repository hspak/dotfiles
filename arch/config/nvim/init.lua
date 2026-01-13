require("config.lazy")

-- personal keybindings
vim.keymap.set("n", "Q", "<C-W>q")
vim.keymap.set("n", "W", ":wq<CR>")
vim.keymap.set("n", "V", ":vsplit<CR> :wincmd l<CR>")
vim.keymap.set("n", "H", ":split<CR> :wincmd j<CR>")
vim.keymap.set("n", "<F12>", ":set hlsearch! hlsearch?<CR>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set('n', '<LocalLeader>l', ":Lexplore<CR> :vertical resize 30<CR>")

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Removes trailing whitespace on save',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})


-- Lua equivalents for previous Vimscript settings

-- Show whitespace characters
vim.opt.list = true

-- Don't show intro message
vim.opt.shortmess:append('I')

-- Enable filetype plugins (usually on by default)
vim.cmd('filetype plugin on')

-- Filetype specific options
local ft_settings = {
  c = {tabstop = 8, shiftwidth = 8},
  javascript = {tabstop = 2, shiftwidth = 2, expandtab = true},
  cpp = {tabstop = 4, shiftwidth = 4},
  rust = {tabstop = 4, shiftwidth = 4},
  java = {tabstop = 4, shiftwidth = 4},
  make = {expandtab = false},
  python = {tabstop = 4, shiftwidth = 4, expandtab = true},
  markdown = {tabstop = 2, shiftwidth = 2, textwidth = 80, colorcolumn = '100', expandtab = true},
  go = {tabstop = 4, shiftwidth = 4, expandtab = false},
  lex = {tabstop = 8, shiftwidth = 8},
  yacc = {tabstop = 8, shiftwidth = 8},
  lua = {tabstop = 2, shiftwidth = 2, expandtab = true},
  json = {conceallevel = 0},
}

for ft, opts in pairs(ft_settings) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = ft,
    callback = function()
      for opt, val in pairs(opts) do
        vim.bo[opt] = val
      end
    end,
  })
end

-- Command-line abbreviations (kept as Vimscript for simplicity)
vim.cmd([[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])
