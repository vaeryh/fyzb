local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "秦霜"

-- 物编ID
mt.id = 'Qs00'

-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'map.hero.秦霜.D'
        require 'map.hero.秦霜.Q'
        require 'map.hero.秦霜.W'
        require 'map.hero.秦霜.E'
        require 'map.hero.秦霜.R'
        gTrg.remove()
    end
end)

return mt
