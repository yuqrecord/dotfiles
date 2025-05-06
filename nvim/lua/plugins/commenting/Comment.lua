return {
  'numToStr/Comment.nvim',
  opts = {
    -- g ではなく <Leader>c を起点にする
    toggler  = {
      line  = '<Leader>cc',   -- 例: <Space>c で 1 行トグル
      block = '<Leader>bc',   -- ブロックコメント用（任意）
    },
    opleader = {
      line  = '<Leader>c',   -- 例: <Space>c2j で 2 行トグル
      block = '<Leader>b',
    },
    extra = {
      ---Add comment on the line above
      above = '<Leader>cO',
      ---Add comment on the line below
      below = '<Leader>co',
      ---Add comment at the end of line
      eol = '<Leader>cA',
    },
    -- 追加マッピングを残す・消す（好みで）
    mappings = {
      basic = true,   -- <Leader>c / b の基本操作（必須）
      extra = true,   -- <Leader>cA などの “extra” 系
    },
  },
}
