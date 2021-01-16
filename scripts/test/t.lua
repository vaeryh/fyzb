local jass = require 'jass.common'
local debug = require 'jass.debug'
local rect = require 'types.rect'
local yh = require 'types.yh'
printF("函数重载")

for i = 1, 10 do
    local id = string.format('at'.."%02d",i)
    print(yh.s2id(id))
    local u = unit.create(Player(11), id, x, y, 270)
    local u = unit.create(Player(11), 'id', x, y, 270)
end
-- for k, v in pairs(sound) do
--     print(k,v)
-- end
-- PlayMusic(jass.gg_snd_FezdYezf01)

-- local trig = yh.createTrigger(function()
--     local g = require 'jass.globals'
--     local minX = GetRectMinX(g.gg_rct_FirstHeroSelection)
--     local minY = GetRectMinY(g.gg_rct_FirstHeroSelection)
--     print(minX,minY)
--     u = CreateUnit(Player(12), yh.s2id('hfoo'),minX, minY, 270)
--     --heal(u, 3, -200)
--     --DestroyTrigger(GetTriggeringTrigger())
-- end)
-- TriggerRegisterTimerEvent(trig, 1, true)

-- return false
