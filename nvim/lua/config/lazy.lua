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

-- Setup lazy.nvim
require("lazy").setup({
  -- import your plugins
  spec = {
    -- Theme
    -- { import = "plugins.theme.nightfox" },
    -- { import = "plugins.theme.onenord" },
    { import = "plugins.theme.vim-hybrid" },
    -- UI
    { import = "plugins.ui.vim-airline" },
    { import = "plugins.ui.winresizer" },
    { import = "plugins.ui.tagbar" },
    { import = "plugins.ui.indent-blankline" },
    { import = "plugins.ui.noice" },
    -- Filer
    { import = "plugins.filer.nvim-tree" },
    -- Syntax
    { import = "plugins.syntax.nvim-treesitter" },
    -- Commenting
    { import = "plugins.commenting.Comment" },
    -- Git
    { import = "plugins.git.vim-findroot" },
    { import = "plugins.git.gitsigns" },
    { import = "plugins.git.vim-fugitive" },
    -- Formatter
    { import = "plugins.formatter.vim-better-whitespace" },
    -- Rust
    { import = "plugins.languages.rust.rust-vim" },
    -- HTML
    { import = "plugins.languages.html.emmet-vim" },
    -- Copilot
    { import = "plugins.copilot.copilot"},
    { import = "plugins.copilot.CopilotChat" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
