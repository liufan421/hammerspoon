local hyper = {'shift', 'cmd'}
--local hyper2 = {'ctrl', 'cmd'}
--local hyper3 = {'alt', 'ctrl'}

-- open application by keyboard shortcut
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("AppLauncher", {
  hotkeys = {
    c = "Calendar",
    f = "Finder",
    p = "System Preferences",
    s = "Safari",
    i = "iTerm",
    m = "Mail",
    w = "Wechat"
  }
})
--local function toggleApplication(name)
  --hs.application.enableSpotlightForNameSearches(true)
  --local app = hs.application.find(name)
  --if not app or app:isHidden() then
    --hs.application.launchOrFocus(name)
  --elseif hs.application.frontmostApplication() ~= app then
    --app:activate()
  --else
    --app:hide()
  --end
--end

--hs.hotkey.bind(hyper3, "s", function() toggleApplication("Safari") end)
--hs.hotkey.bind(hyper3, "f", function() toggleApplication("Finder") end)
--hs.hotkey.bind(hyper3, "m", function() toggleApplication("Music") end)
--hs.hotkey.bind(hyper3, "p", function() toggleApplication("System Preferences") end)
--hs.hotkey.bind(hyper3, "i", function() toggleApplication("iTerm") end)
--hs.hotkey.bind(hyper3, "r", function() hs.alert.show(hyper2) end)

-- hyper + up maximize the current window
hs.hotkey.bind(hyper, 'up', function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, 'down', function ()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 4)
  f.y = max.y + (max.h / 4)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "Left", function()
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

hs.hotkey.bind(hyper, "Right", function()
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

-- move window to other screen
--moveto = function(win, n)
  --local screens = hs.screen.allScreens()
  --if n > #screens then
    --hs.alert.show("No enough screens " .. #screens)
  --else
    --local toWin = hs.screen.allScreens()[n]:name()
    --hs.alert.show("Move " .. win:application():name() .. " to " .. toWin)

    --hs.layout.apply({{nil, win:title(), toWin, hs.layout.maximized, nil, nil}})

  --end
--end
--hs.hotkey.bind(hyper2, "1", function()
  --local win = hs.window.focusedWindow()
  --moveto(win, 1)
--end)
--hs.hotkey.bind(hyper2, "2", function()
  --local win = hs.window.focusedWindow()
  --moveto(win, 2)
--end)
--hs.hotkey.bind(hyper2, "3", function()
  --local win = hs.window.focusedWindow()
  --moveto(win, 3)
--end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
