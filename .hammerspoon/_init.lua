alacritty_move_focus = require "misc/alacritty_move_focus"

hs.hotkey.bind({"cmd", "ctrl"}, "I", alacritty_move_focus)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x - 10
--   win:setFrame(f)
-- end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  local laptopScreen = "MBP"
  local windowLayout = {
      {"Google Chrome",  nil,          laptopScreen, hs.layout.left30,    nil, nil},
      {"Alacritty",    nil,          laptopScreen, hs.layout.right70,   nil, nil},
  }
  hs.layout.apply(windowLayout)
end)