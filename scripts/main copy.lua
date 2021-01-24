-----------------------------------------------------------------------------------------
-- 类型库
do
    gYh = require 'types.yh'
    gTrg = require 'types.trigger'
    gP = require 'types.player'
    gU = require 'types.unit'
    gH = require 'types.hero'
    gT = require 'types.timer'
    gRect = require 'types.rect'
    gCamera = require 'types.camera'
    gFog = require 'types.fogmodifier'
    gSound = require 'types.sound'
    gDia = require 'types.dialog'
    gGame = require 'types.game'
    gGroup = require 'types.group'
end
-- 外置库
do
    gDz = require 'lua.lua2jass.BlizzardAPI'

end
-----------------------------------------------------------------------------------------
-- 本地图库
require 'map.init'
-- 英雄
require 'hero.init'
