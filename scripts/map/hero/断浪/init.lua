local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "断浪"

-- 物编ID
mt.id = 'Dl00'

-- 英雄
mt.hero = nil
-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        log.info(mt.name .. '载入成功····')
        mt.hero = GetTriggerUnit()
        require 'map.hero.断浪.D'
        require 'map.hero.断浪.Q'
        require 'map.hero.断浪.W'
        require 'map.hero.断浪.E'
        require 'map.hero.断浪.R'
        gTrg.remove()
    end
end)

return mt
