local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "断浪"

-- 物编ID
mt.id = 'Dl00'

--英雄
mt.hero = nil
-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        mt.hero = GetTriggerUnit()
        require 'hero.断浪.D'
        require 'hero.断浪.Q'
        require 'hero.断浪.W'
        require 'hero.断浪.E'
        require 'hero.断浪.R'
        gTrg.remove()
    end
end)

return mt
