-- Augroup ID
local AU = {}
local function augroup(name)
  -- すでに存在すれば再利用
  if AU[name] then
    return AU[name]
  end
  -- なければ作成して辞書に保存
  local id = vim.api.nvim_create_augroup(name, { clear = true })
  AU[name] = id
  return id
end

-- PATH of Python
local python = "/usr/bin/python3"
if vim.fn.executable(python) == 1 then
  vim.g.python3_host_prog = python
end

-- Disable the default filer
vim.api.nvim_set_var("loaded_netrw", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)

-- Share clipboard with the system
vim.api.nvim_set_option_value('clipboard', 'unnamedplus', {})

-- Line number
vim.api.nvim_set_option_value('number', true, {})
vim.api.nvim_set_option_value('relativenumber', true, {})

-- Sign column
vim.api.nvim_set_option_value('signcolumn', 'yes', {})

-- Wrap line
vim.api.nvim_set_option_value('wrap', false, {})

-- Popup window
vim.api.nvim_set_option_value("termguicolors", true, {})
vim.api.nvim_set_option_value("pumblend", 20, {})
vim.api.nvim_set_option_value("winblend", 20, {})

-- Config for all files
vim.api.nvim_set_option_value('expandtab', true, {})
vim.api.nvim_set_option_value('tabstop', 2, {})
vim.api.nvim_set_option_value('shiftwidth', 0, {})

-- Config for Makefile
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = 'makefile',
  group = augroup('makefile', {}),
  callback = function()
    vim.api.nvim_buf_set_option(0, 'expandtab', false)
  end,
})
