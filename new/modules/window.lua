local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'

-- hide window shadows
window.setShadows(false)

-- vsplit --------------------------------------------------

hotkey.bind(hyper, '[', function()
    window.focusedWindow():moveToUnit(layout.left50)
end)

hotkey.bind(hyper, ']', function()
    window.focusedWindow():moveToUnit(layout.right50)
end)

-- fullscreen

hotkey.bind(hyper, 'Up', function()
    local frameCache = {}
    local win = window.focusedWindow()
    if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()])
        frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:maximize()
    end
end)

-- move the current window to another monitor

hotkey.bind(hyperShift, 'left', function()
    local w = window.focusedWindow()
    if not w then
        return
    end

    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

hotkey.bind(hyperShift, 'right', function()
    local w = window.focusedWindow()
    if not w then
        return
    end

    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

-- bring focus to next display/screen

hotkey.bind({ "alt" }, "`", function()
    focusScreen(hs.window.focusedWindow():screen():next())
end)

--Bring focus to previous display/screen
hotkey.bind({ "alt", "shift" }, "`", function()
    focusScreen(hs.window.focusedWindow():screen():previous())
end)

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
    return win:screen() == screen
end

-- Brings focus to the scren by setting focus on the front-most application in it.
-- Also move the mouse cursor to the center of the screen. This is because
-- Mission Control gestures & keyboard shortcuts are anchored, oddly, on where the
-- mouse is focused.
function focusScreen(screen)
    --Get windows within screen, ordered from front to back.
    --If no windows exist, bring focus to desktop. Otherwise, set focus on
    --front-most application window.
    local windows = hs.fnutils.filter(hs.window.orderedWindows(),
        hs.fnutils.partial(isInScreen, screen))
    local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
    windowToFocus:focus()

    -- Move mouse to center of screen
    local pt = geometry.rectMidPoint(screen:fullFrame())
    mouse.setAbsolutePosition(pt)
end

