-- global functions

function reload()
    hs.reload()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Config Reloaded"
    }):send()
end

function console(content)
    hs.openConsole()
    if content then
        hs.printf(hs.inspect(content))
    end
end

function printf(content)
    hs.printf(hs.inspect(content))
end