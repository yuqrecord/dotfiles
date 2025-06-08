return {
  'numToStr/Comment.nvim',
  opts = {
    -- g ではなく <Leader>c を起点にする
    toggler  = {
      line  = 'gcc',   -- 例: gcc で 1 行トグル
      block = 'gbc',   -- ブロックコメント用（任意）
    },
    opleader = {
      line  = 'gc',   -- 例: <Space>c2j で 2 行トグル
      block = 'gb',
    },
    extra = {
      ---Add comment on the line above
      above = 'gcO',
      ---Add comment on the line below
      below = 'gco',
      ---Add comment at the end of line
      eol = 'gcA',
    },
    -- 追加マッピングを残す・消す（好みで）
    mappings = {
      basic = true,   -- <Leader>c / b の基本操作（必須）
      extra = true,   -- <Leader>cA などの “extra” 系
    },
  },
}
