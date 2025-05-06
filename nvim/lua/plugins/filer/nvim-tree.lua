return {
  "nvim-tree/nvim-tree.lua",
  config = true,
  keys = {
    {
      mode="n",
      "<Leader>e",
      function() vim.cmd.NvimTreeToggle() end,
      desc = "Toggle NvimTree",
    }
  },
  dependencies = {"nvim-tree/nvim-web-devicons"},
}
