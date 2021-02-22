local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄代码
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "凤舞"

-- 物编ID
mt.id = 'Fw00'

-- 技能ID
mt.abiId = {'FwD0', 'FwQ0', 'FwW0', 'FwE0', 'FwR0'}

-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'map.hero.凤舞.D'
        require 'map.hero.凤舞.Q'
        require 'map.hero.凤舞.W'
        require 'map.hero.凤舞.E'
        require 'map.hero.凤舞.R'
        gTrg.remove()
    end
end)

return mt
