vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- 共通オプション
local opts = { noremap = true, silent = true }
local map  = vim.keymap.set        -- 省略記法

---------------------------------------------------------------------------
-- Terminal を開く
---------------------------------------------------------------------------
-- 横 split
vim.keymap.set('n', '<Leader>ts', function()
  vim.cmd('split | terminal')
  vim.cmd('startinsert')
end, opts)
-- 縦 split
vim.keymap.set('n', '<Leader>tv', function()
  vim.cmd('vsplit | terminal')
  vim.cmd('startinsert')
end, opts)
-- 新しいタブ
vim.keymap.set('n', '<Leader>tt', function()
  vim.cmd('tab split | terminal')
  vim.cmd('startinsert')
end, opts)

---------------------------------------------------------------------------
-- Normal モード
---------------------------------------------------------------------------
map('n', '<C-y>', '<C-l>', opts)           -- 画面再描画
map('n', 'm',      ':noh<CR>', opts)       -- 検索ハイライト解除

-- ウィンドウ移動キーを入れ替え
map('n', '<C-w>j', '<C-w>h', opts)
map('n', '<C-w>k', '<C-w>j', opts)
map('n', '<C-w>i', '<C-w>k', opts)
map('n', '<C-w>h', '<C-w>i', opts)         -- 縦 split との整合

-- カーソル下単語を新規タブで定義ジャンプ
map('n', '<C-h>', function()
  vim.cmd('tab sp')
  vim.cmd('tjump ' .. vim.fn.expand('<cword>'))
end, opts)

-- タブ移動
map('n', '<C-p>', 'gT', opts)
map('n', '<C-n>', 'gt', opts)

---------------------------------------------------------------------------
-- Normal / Visual / Operation モード共通
---------------------------------------------------------------------------

-- 基本移動キーの置換
map('', 'j', 'h', opts)
map('', 'i', 'k', opts)
map('', 'k', 'j', opts)

-- 行頭 / 行末
map('', '<C-l>', '$', opts)
map('', '<C-j>', '0', opts)

---------------------------------------------------------------------------
-- Normal / Visual  モード共通
---------------------------------------------------------------------------
local nv = { 'n', 'v' }

-- ジャンプリスト
map(nv, '<C-u>', '<C-i>', opts)

-- 画面スクロール・水平スクロール
map(nv, '<C-i>',    '<C-y>', opts)
map(nv, '<C-k>',    '<C-e>', opts)
map(nv, '<Right>',  'zl',    opts)
map(nv, '<Left>',   'zh',    opts)
map(nv, '<Up>',     '<C-y>', opts)
map(nv, '<Down>',   '<C-e>', opts)
map(nv, '<C-e>',    '<C-u>', opts)
map(nv, '<S-Right>','zL',    opts)
map(nv, '<S-Left>', 'zH',    opts)

-- 挿入関連
map(nv, 's', 'i', opts)
map(nv, 'S', 'I', opts)     -- Visual のみで I へ
map(nv, 'h', 's', opts)

---------------------------------------------------------------------------
-- Insert モード
---------------------------------------------------------------------------
map('i', '<C-f>', '<Right>', opts)
map('i', '<C-b>', '<Left>',  opts)
map('i', '<C-l>', '<Esc>',   opts)
map('i', '(',      '()<Left>', opts)
map('i', '<C-k>', '<NOP>',   opts)

---------------------------------------------------------------------------
-- Terminal モード
---------------------------------------------------------------------------
map('t', '<Esc>', [[<C-\><C-n>]],             opts)           -- Job → Normal
map('t', '<C-o>', [[<C-\><C-n>:q<CR>]],       opts)           -- 閉じる
map('t', '<C-g>', [[<C-\><C-n><C-w><C-w>]],   opts)           -- ウィンドウ移動

-- Terminal バッファに入ったら自動で insert へ
vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.cmd('startinsert')
    end
  end,
})
-- ───────────────────────────────────────────────────────────────────────

