-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.number = true -- enable line numbers
vim.opt.title = true -- update terminal title
vim.opt.clipboard:append("unnamedplus") -- copy&paste support for wayland
vim.opt.virtualedit = "all" -- allow cursor to go anywhere
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- upper-case sensitive search

vim.opt.expandtab = true -- conver tabs to spaces
vim.opt.tabstop = 2 -- 2 spaces per tab
vim.opt.shiftwidth=2 -- use < > for shifting tabs

require("lazy").setup({
  spec = {
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      priority = 99,
      dependencies = {
        { "ms-jpq/coq_nvim", branch = "coq" },
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
      },
      init = function()
        vim.g.coq_settings = {
          auto_start = "shut-up",
          ["display.icons.mode"] = "none",
        }
      end,
      config = function()
        local coq = require("coq")

        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
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

            vim.diagnostic.config({virtual_text = false})
            local signs = { Error = "💩", Warn = "💩", Hint = "💩", Info = "💩" }
            for type, icon in pairs(signs) do
              local hl = "DiagnosticSign" .. type
              vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end

        vim.lsp.config('zls', {})
        vim.lsp.enable({'zls'})
        vim.lsp.config('pyright', {})
        vim.lsp.enable({'pyright'})
        vim.lsp.config('ts_ls', {})
        vim.lsp.enable({'ts_ls'})
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      priority = 98,
      build = ":TSUpdate"
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      lazy = false,
      priority = 97,
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end,
    },
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      config = function()
        vim.cmd.colorscheme("carbonfox")
      end,
    },
    { "numToStr/Comment.nvim" },
    { "tpope/vim-fugitive" },
  },
  checker = { enabled = true },
}, {
  rocks = { enabled = false },
})
