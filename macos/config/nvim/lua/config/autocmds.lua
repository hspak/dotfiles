local trim_group = vim.api.nvim_create_augroup('UserTrimWhitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  group = trim_group,
  desc = 'Remove trailing whitespace on save',
  callback = function(event)
    if not vim.bo[event.buf].modifiable then
      return
    end

    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

local ft_settings = {
  c = { tabstop = 8, shiftwidth = 8 },
  javascript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  typescript = { tabstop = 2, shiftwidth = 2, expandtab = true },
  typescriptreact = { tabstop = 2, shiftwidth = 2, expandtab = true },
  cpp = { tabstop = 4, shiftwidth = 4 },
  rust = { tabstop = 4, shiftwidth = 4 },
  java = { tabstop = 4, shiftwidth = 4 },
  make = { expandtab = false },
  python = { tabstop = 4, shiftwidth = 4, expandtab = true },
  markdown = { tabstop = 2, shiftwidth = 2, textwidth = 80, colorcolumn = '100', expandtab = true },
  go = { tabstop = 4, shiftwidth = 4, expandtab = false },
  lex = { tabstop = 8, shiftwidth = 8 },
  yacc = { tabstop = 8, shiftwidth = 8 },
  lua = { tabstop = 2, shiftwidth = 2, expandtab = true },
  json = { conceallevel = 0 },
}

local ft_group = vim.api.nvim_create_augroup('UserFiletypeSettings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ft_group,
  pattern = vim.tbl_keys(ft_settings),
  callback = function(event)
    for opt, val in pairs(ft_settings[event.match] or {}) do
      vim.opt_local[opt] = val
    end
  end,
})

-- Neovim does not expose a Lua abbreviation API.
vim.cmd([[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]])
