local hotkey = require 'hs.hotkey'
local application = require 'hs.application'

-- 重新加载
-- hotkey.bind(hyper, 'escape', reload)

-- 打开控制台
hotkey.bind(hyper, '`', console)

-- 弹出当前应用名字
hotkey.bind(hyper, '/', function()
    current = application.frontmostApplication()
    if current ~= nil then
        name = current:name()
        console(name)
        bundleID = current:bundleID()
        console(bundleID)
    end
end)

-- 绑定应用快捷键
for key, app in pairs(key2App) do
    hotkey.bind(hyper, key, function()
        application.launchOrFocus(app)
    end)
end

-- 移动当前应用到屏幕左边/右边
hotkey.bind(hyper, 'Left', function()
    hs.window:moveOneScreenWest()
end)

-- 无限翻页，按住=键，松开-键
-- local keepTap = true
-- hotkey.bind(hyper, '=', function()
--     if (not keepTap)
--     then
--         keepTap = true
--     end
--     hs.timer.doWhile(function()
--         return keepTap
--     end, function()
--         hs.eventtap.keyStroke(nil, "pagedown", 200000)
--     end, 0.1)
-- end)
-- hotkey.bind(hyper, '-', function()
--     keepTap = false
-- end)
