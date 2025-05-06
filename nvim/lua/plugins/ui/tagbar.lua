return {
  "preservim/tagbar",
  keys = {
    {
      mode = "n",
      "<Leader>t",
      function () vim.cmd.TagbarToggle() end,
      desc = "Toggle Tagbar",
    }
  },
  init = function()
    vim.g.tagbar_map_togglecaseinsensitive = "u"
    -- nnoremap <Leader>t :TagbarToggle<CR>
  end,
}
