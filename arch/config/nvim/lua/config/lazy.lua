local treesitter_parsers = {
  "c",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "odin",
  "python",
  "query",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "zig",
}

local treesitter_filetypes = {
  "c",
  "javascript",
  "javascriptreact",
  "lua",
  "markdown",
  "odin",
  "python",
  "query",
  "typescript",
  "typescriptreact",
  "vim",
  "vimdoc",
  "zig",
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to clone lazy.nvim; check Git/network access and restart Neovim.\n" .. out, vim.log.levels.ERROR)
    return
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
        local treesitter = require("nvim-treesitter")
        treesitter.setup({})
        treesitter.install(treesitter_parsers)

        -- Highlighting / indent are no longer modules; enable via Neovim APIs.
        local treesitter_group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
          group = treesitter_group,
          pattern = treesitter_filetypes,
          desc = "Enable treesitter highlight and indent",
          callback = function(event)
            local ok = pcall(vim.treesitter.start, event.buf)
            local lang = vim.treesitter.language.get_lang(event.match)
            local query_ok, indent_query = pcall(vim.treesitter.query.get, lang, "indents")
            if ok and query_ok and indent_query then
              vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end,
        })
      end,
    },
    {
      'dmtrKovalenko/fff',
      build = function()
        -- downloads a prebuilt binary or falls back to cargo build
        require("fff.download").download_or_build_binary()
      end,
      -- for nixos:
      -- build = "nix run .#release",
      opts = {
        debug = {
          enabled = false,
          show_scores = false,
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
    {
      "tpope/vim-fugitive",
      cmd = {
        "G",
        "Git",
        "GBrowse",
        "GDelete",
        "GMove",
        "GRename",
        "Gdiffsplit",
        "Gedit",
        "Ggrep",
        "Glgrep",
        "Gread",
        "Gsplit",
        "Gtabedit",
        "Gvdiffsplit",
        "Gvsplit",
        "Gwrite",
      },
    },
    {
      "https://codeberg.org/ziglang/zig.vim",
      ft = "zig",
    },
  },
  checker = { enabled = false },
  rocks = { enabled = false },
})
