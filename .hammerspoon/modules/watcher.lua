appWatcher = hs.application.watcher.new(function(name, event, app)

    if event == hs.application.watcher.activated then
        local bid = app:bundleID()
        subBid = string.match(bid, '(.+%..+)%..+')
        if appIgnore[subBid] then
            return true;
        end

        local bSwitch
        local enMethod = hs.keycodes.layouts()[1] or enMethod
        local cnMethod = hs.keycodes.methods()[1] or cnMethod
        local currentMethod = hs.keycodes.currentMethod()

        if appMethods[bid] then
            if currentMethod == cnMethod then
                bSwitch = 1
            else
                bSwitch = hs.keycodes.setMethod(cnMethod)
            end
        else
            if not currentMethod then
                bSwitch = 1
            else
                bSwitch = hs.keycodes.setLayout(enMethod)
            end
        end

        if bSwitch then
            hs.alert.closeAll()
            local method = hs.keycodes.currentMethod()
            if method == nil then
                method = enMethod
            end
            hs.alert.show(name .. ' - ' .. method)
        end
    end
end)           :start()

-- 监听屏幕状态
-- caffeinateWatcher = hs.caffeinate.watcher.new(function(event)
--     --    hs.printf(event)

--     --[[
--         The order when the display is close:
--         systemWillSleep   1
--         screensDidSleep   3
--         screensDidLock    10
--         screensDidWake    4
--         systemDidWake     0
--         screensDidUnlock  11
--     --]]

--     if event == hs.caffeinate.watcher.screenDidSleep then
--         appWatcher:stop()
--     elseif event == hs.caffeinate.watcher.screenDidWake then
--         appWatcher:start()
--         reload()
--     end
-- end)                  :start()

-- 自动重载
-- 加个计时器 防止频繁加载
-- hs.timer.delayed.new(1 * 60, function()
--     myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload):start()
-- end):start()

--[[
-- TODO:
-- 存在切换应用多次回调的问题
inputMethodWatcher = hs.keycodes.inputSourceChanged(function()
    hs.printf('yes')
end)
--]]
