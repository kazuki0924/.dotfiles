-- initial settings
hs.grid.setGrid('12x12') -- allows us to place on quarters, thirds and halves
hs.grid.MARGINX = 30
hs.grid.MARGINY = 30
hs.window.animationDuration = 0 -- disable animations

local grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  bottomRight = '6,6 6x6',
  bottomLeft = '0,6 6x6',
  middleVertical = '4,0 4x12',
  middleHorizontal = '0,4 12x4',
  middleTwoThirds = '2,0 8x12',
  fullScreen = '0,0 12x12',
  centeredHuge = '2,1 8x10',
  centeredBig = '3,2 6x8',
}

local layoutMetrics = {
  leftThird = {x=0, y=0, w=0.333, h=1},
  leftHalf = {x=0, y=0, w=0.5, h=1},
  rightTwoThirds = {x=0.333, y=0, w=0.667, h=1},
  rightHalf = {x=0.5, y=0, w=0.5, h=1},
  middleThird = {x=0.333, y=0, w=0.333, h=1},
  screenshot1 = {x=1280, y=320, w=1280, h=960}
}

-- predefined layouts
-- Application name, window title or window object or function
local layouts = {
  {
    key = '1',
    internal = {
      {"Google Chrome", nil, "Color LCD", layoutMetrics.leftHalf, nil, nil},
      {"kitty", "kitty", "Color LCD", layoutMetrics.rightHalf, nil, nil}
    },
    ultra = {
      {"Google Chrome", nil, "LG ULTRAWIDE", layoutMetrics.leftThird, nil, nil},
      {"kitty", "kitty", "LG ULTRAWIDE", layoutMetrics.rightTwoThirds, nil, nil}
    }
  },
  {
    key = '2',
    internal = {
      {"Google Chrome", nil, "Color LCD", layoutMetrics.leftHalf, nil, nil},
      {"kitty", "kitty", "Color LCD", layoutMetrics.rightHalf, nil, nil}
    },
    ultra = {
      {"kitty", "vimwiki", "LG ULTRAWIDE", layoutMetrics.middleThird, nil, nil}
    }
  },
  {
    key = '3',
    internal = {
    },
    ultra = {
      {"kitty", "vimwiki", "LG ULTRAWIDE", layoutMetrics.screenshot1, nil, nil}
    },
    dell = {
      {"kitty", "vimwiki", "DELL U2715H", layoutMetrics.screenshot1, nil, nil}
    }
  }
}

hs.fnutils.each(layouts, function(object)
  hs.hotkey.bind(mash_screen, object.key, function() ext.app.applyLayout(object) end)
end)
