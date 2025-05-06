return {
  "simeji/winresizer",
  init = function()
    vim.g.winresizer_start_key = "<Leader>r"
    -- j: Right
    -- l: Left (default)
    -- i: Up
    -- k: Down
    vim.g.winresizer_keycode_left = 106
    vim.g.winresizer_keycode_up   = 105
    vim.g.winresizer_keycode_down = 107
  end,
}
