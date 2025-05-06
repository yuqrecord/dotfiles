return {
  "w0ng/vim-hybrid",
  config = function()
    vim.api.nvim_set_var("background", "dark")
    vim.g.hybrid_custom_term_colors = 1
    vim.cmd("colorscheme hybrid")
  end,
}
