local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "神医"

-- 物编ID
mt.id = 'Sy00'

-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'map.hero.神医.D'
        require 'map.hero.神医.Q'
        require 'map.hero.神医.W'
        require 'map.hero.神医.E'
        require 'map.hero.神医.R'
        require 'map.hero.神医.tlA'
        require 'map.hero.神医.tlC'
        gTrg.remove()
    end
end)

return mt
