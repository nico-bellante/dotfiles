hs.grid.setGrid('12x12') -- allows us to place on quarters, thirds and halves
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.window.animationDuration = 0 -- disable animations

local logger = hs.logger.new('pengurino', 'info')

-- func declarations
local chain = nil

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
  fullScreen = '0,0 12x12',
  centeredBig = '3,3 6x6',
  centeredSmall = '4,4 4x4',
}

local lastSeenChain = nil
local lastSeenWindow = nil

chain = (function(movements)
  local chainResetInterval = 2
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
    local win = hs.window.frontmostWindow()
    local id = win:id()
    local now = hs.timer.secondsSinceEpoch()
    local screen = win:screen()

    if
      lastSeenChain ~= movements or
      lastSeenAt < now - chainResetInterval or
      lastSeenWindow ~= id
    then
      sequenceNumber = 1
      lastSeenChain = movements
    elseif (sequenceNumber == 1) then
      screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end)



-- key bindings --
local hyper = {'shift', 'cmd', 'ctrl', 'alt'}

hs.hotkey.bind(hyper, 'up', chain({
  grid.topHalf,
  grid.topThird,
  grid.topTwoThirds,
}))

hs.hotkey.bind(hyper, 'right', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))

hs.hotkey.bind(hyper, 'down', chain({
  grid.bottomHalf,
  grid.bottomThird,
  grid.bottomTwoThirds,
}))

hs.hotkey.bind(hyper, 'left', chain({
  grid.leftHalf,
  grid.leftThird,
  grid.leftTwoThirds,
}))


hs.hotkey.bind(hyper, 'f', chain({
  grid.fullScreen,
  grid.centeredBig,
}))



hs.hotkey.bind(hyper, 'g', function() hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, 't', function() hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(hyper, 's', function() hs.application.launchOrFocus("Safari") end)
hs.hotkey.bind(hyper, 'c', function() hs.application.launchOrFocus("Visual Studio Code") end)

hs.hotkey.bind({'ctrl', 'option'}, 'm', function() hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:name(), app:pid()) end) end)

logger.i('Config loaded')