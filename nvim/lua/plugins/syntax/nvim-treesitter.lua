return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").install({
      "bash",
      "c",
      "cpp",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "rust",
      "vim",
      "vimdoc",
      "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
