local Hydra = require("hydra")

-- ❶ Hydra を定義。ただし body は ――**付けない**――
local float_move = Hydra({
  name = "Float-Move",
  mode = "n",
  hint  = "Move a floating window (Shift key to move 2 cells)",
  config = { color = "amaranth" },   -- Esc で抜ける／それ以外は継続
  heads = {
    { "j", function() nudge(-1,  0) end, {desc = "Left"} },
    { "J", function() nudge(-2,  0) end, },
    { "k", function() nudge( 0,  1) end, {desc = "Down"} },
    { "K", function() nudge( 0,  2) end, },
    { "i", function() nudge( 0, -1) end, {desc = "Up"} },
    { "I", function() nudge( 0, -2) end, },
    { "l", function() nudge( 1,  0) end, {desc = "Right"} },
    { "L", function() nudge( 2,  0) end, },
    { "<Enter>", nil, { exit = true, desc = "Quit" } },
  },
})

-- ❷ フロート判定してから activate
vim.keymap.set("n", "<leader>f", function()
  if vim.api.nvim_win_get_config(0).relative ~= "" then
    float_move:activate()          -- いまのフロートで Hydra開始
  else
    vim.notify("This is not a floating window.", vim.log.levels.INFO)
  end
end, { desc = "Float-move mode" })

-- ❸ １セル動かす関数
function nudge(dx, dy)
  local win, cfg = 0, vim.api.nvim_win_get_config(0)
  if cfg.relative == "" then return end               -- 念のため
  cfg.col, cfg.row = cfg.col + dx, cfg.row + dy
  vim.api.nvim_win_set_config(win, cfg)
end
