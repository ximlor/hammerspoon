local hotkey = require 'hs.hotkey'
local grid = require 'hs.grid'

-- Hotkeys to interact with the window grid
hotkey.bind(hyper, ',', grid.show)

-- the position of window on screen
hotkey.bind(hyper, 'Left', grid.pushWindowLeft)
hotkey.bind(hyper, 'Right', grid.pushWindowRight)

