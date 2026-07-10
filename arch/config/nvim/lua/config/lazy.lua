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
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPost", "BufNewFile" },
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          highlight = { enable = true },
          indent = { enable = true },
        })
      end,
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      cmd = "Telescope",
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
      },
    },
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("carbonfox")
      end,
    },
    { "numToStr/Comment.nvim", opts = {} },
    { "tpope/vim-fugitive" },
    { "https://codeberg.org/ziglang/zig.vim" },
  },
  checker = { enabled = false },
  rocks = { enabled = false },
})
