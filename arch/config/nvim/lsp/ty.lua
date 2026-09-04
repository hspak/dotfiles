---@type vim.lsp.Config
return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'uv.lock',
    'requirements.txt',
    '.git',
  },
  settings = {
    ty = {
      diagnosticMode = 'openFilesOnly',
    },
  },
}
