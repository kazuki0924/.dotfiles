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
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Y', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'K', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'U', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'H', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'L', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'B', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'J', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'N', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Left', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'Right', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

local laptopScreen = hs.screen.allScreens()[1]:name()
hs.application.enableSpotlightForNameSearches(true)

local windowLayout = {
  -- {'Google Chrome', nil, laptopScreen, hs.layout.left60, nil, nil},
  {'Google Chrome', nil, laptopScreen, {x = 0, y = 0, w = 0.5, h = 1}, nil, nil},
  {'Alacritty', nil, laptopScreen, hs.layout.right50, nil, nil}
}

hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'M', function()
  hs.layout.apply(windowLayout)
end)

-- hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'M', function()
--   local laptopScreen = hs.screen.allScreens()[1]:name()
--   hs.application.enableSpotlightForNameSearches(true)

--   local windowLayout = {
--     {'Google Chrome', nil, laptopScreen, hs.layout.left60, nil, nil},
--     {'Slack', nil, laptopScreen, hs.layout.bottom40, nil, nil}
--   }

--   hs.layout.apply(windowLayout)
-- end)

function reloadConfig(files)
  local doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == '.lua' then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/',
  reloadConfig):start()
hs.alert.show('Config loaded')


