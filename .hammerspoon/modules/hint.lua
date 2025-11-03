local hotkey = require 'hs.hotkey'
local hints = require 'hs.hints'
local window = require 'hs.window'

-- hints --------------------------------------------------

-- TODO:
-- 使用程序名称首字母作为快捷键存在系统应用无字母问题
--hints.style = 'vimperator'

hotkey.bind('Ctrl', 'up', function()
    hints.windowHints()
end)

hotkey.bind('Ctrl', 'down', function()
    hints.windowHints(window.focusedWindow():application():allWindows())
end)

