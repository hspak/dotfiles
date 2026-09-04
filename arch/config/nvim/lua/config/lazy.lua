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

require("lazy").setup({
  spec = {
    {
      -- master is frozen and does not support Neovim 0.12; main is the rewrite.
      "nvim-treesitter/nvim-treesitter",
      branch = "main",
      lazy = false,
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter").setup({})

        -- Highlighting / indent are no longer modules; enable via Neovim APIs.
        vim.api.nvim_create_autocmd("FileType", {
          desc = "Enable treesitter highlight and indent",
          callback = function(event)
            local ok = pcall(vim.treesitter.start, event.buf)
            if ok then
              vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end,
        })
      end,
    },
    {
      'dmtrKovalenko/fff.nvim',
      build = function()
        -- downloads a prebuilt binary or falls back to cargo build
        require("fff.download").download_or_build_binary()
      end,
      -- for nixos:
      -- build = "nix run .#release",
      opts = {
        debug = {
          enabled = true,
          show_scores = true,
        },
      },
      lazy = false, -- the plugin lazy-initialises itself
      keys = {
        { "ff", function() require('fff').find_files() end, desc = 'FFFind files' },
        { "fg", function() require('fff').live_grep() end, desc = 'LiFFFe grep' },
        { "fz",
          function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
          desc = 'Live fffuzy grep',
        },
        { "fw",
          function() require('fff').live_grep_under_cursor() end,
          mode = { 'n', 'x' },
          desc = 'Search current word / selection',
        },
      },
    },
    { "numToStr/Comment.nvim", opts = {} },
    { "tpope/vim-fugitive" },
    { "https://codeberg.org/ziglang/zig.vim" },
  },
  checker = { enabled = false },
  rocks = { enabled = false },
})
