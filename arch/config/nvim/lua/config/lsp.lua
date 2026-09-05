local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
local diagnostic_jump = function(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      on_jump = function()
        vim.diagnostic.open_float()
      end,
    })
  end
end
vim.keymap.set('n', '[d', diagnostic_jump(-1), opts)
vim.keymap.set('n', '<C-n>', diagnostic_jump(1), opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "H",
      [vim.diagnostic.severity.INFO] = "I",
    },
  },
})
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    if selected == -1 then
      return '<C-n><C-y>'
    end
    return '<C-y>'
  end

  return '<Tab>'
end, { expr = true, replace_keycodes = true, desc = 'Accept completion or insert tab' })

local lsp_attach_group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_attach_group,
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gf', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- Format Odin files with odinfmt via ols on save.
    if client and client.name == 'ols' and client:supports_method('textDocument/formatting') then
      local format_group = vim.api.nvim_create_augroup('OlsFormatOnSave', { clear = false })
      vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = format_group,
        buffer = bufnr,
        desc = 'Format Odin with odinfmt via ols',
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            id = client.id,
            async = false,
          })
        end,
      })
    end
  end,
})

-- Missing optional language tools should not error whenever a file is opened.
-- setup --check reports missing executables with installation guidance.
for name, executable in pairs({ zls = 'zls', ts_ls = 'typescript-language-server', ols = 'ols', ty = 'ty' }) do
  if vim.fn.executable(executable) == 1 then
    vim.lsp.enable(name)
  end
end
