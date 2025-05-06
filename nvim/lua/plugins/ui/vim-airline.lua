return {
  "vim-airline/vim-airline-themes",
  dependencies = {"vim-airline/vim-airline"},
  init = function()
    vim.g.airline_theme="hybrid"
  end,
}
