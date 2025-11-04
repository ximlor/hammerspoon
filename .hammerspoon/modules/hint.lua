local hotkey = require 'hs.hotkey'
local hints = require 'hs.hints'
local window = require 'hs.window'

-- 窗口提示
hotkey.bind('Ctrl', '[', function()
    hints.windowHints()
end)

-- 应用内窗口提示
hotkey.bind('Ctrl', ']', function()
    hints.windowHints(window.focusedWindow():application():allWindows())
end)

