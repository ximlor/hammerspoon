-- global variables

-- hyper key
-- 虽然可以自定义，但尽量不要设置为 ctrl + cmd，当 hotkey 与系统快捷键产生冲突时，会失效
hyper = { 'ctrl', 'alt', 'cmd' }
hyperShift = { 'ctrl', 'alt', 'cmd', 'shift' }

key2App = {
    b = 'Google Chrome',
    k = 'Visual Studio Code',
    i = 'iTerm',
    e = '印象笔记',
    f = 'Finder',
    o = 'Obsidian',
    w = 'wpsoffice',
}
-- 上面的应用大部分都可以使用应用名称，但个别应用（如 wps）需要与 ~/applications 中的应用名称一致

-- 自动切换中文输入法app
appMethods = {
    ['com.google.Chrome'] = 1,
    ['com.google.Chrome.canary'] = 1,
    ['com.evernote.Evernote'] = 1,
    ['com.tencent.qq'] = 1,
    ['com.tencent.xinWeChat'] = 1,
    ['com.apple.mail'] = 1,
    ['com.coderforart.MWeb'] = 1,
    ['com.Alternote'] = 1,
    ['com.apple.iWork.Numbers'] = 1,
    ['com.kingsoft.wpsoffice.mac'] = 1,
    ['com.yinxiang.Mac'] = 1,
    ['md.obsidian'] = 1,
    ['com.tencent.txdocs'] = 1,
}
cnMethod = '微信输入法'
cnMethod_sogou = '搜狗拼音'
enMethod = 'U.S.'

-- TODO: 改用正则匹配
appIgnore = {
    ['com.apple'] = 1,
    ['org.hammerspoon'] = 1,
}

require "modules/utility"

require "modules/hotkey"
require "modules/watcher"

require "modules/window"
require "modules/grid"
require "modules/hint"
