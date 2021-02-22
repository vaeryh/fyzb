local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "步惊云"

-- 物编ID
mt.id = 'Bjy0'

-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'map.hero.步惊云.D'
        require 'map.hero.步惊云.Q'
        require 'map.hero.步惊云.W'
        require 'map.hero.步惊云.E'
        require 'map.hero.步惊云.R'
        gTrg.remove()
    end
end)

return mt
