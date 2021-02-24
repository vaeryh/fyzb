Hero = {}
local x, y = -2007, -9189

local hero = gU.create(Player(0), 'Fw00', x, y, 270)
PanCameraToTimed(x, y, 0.33)
SelectUnit(hero, true)

Hero[Player(0)] = hero
