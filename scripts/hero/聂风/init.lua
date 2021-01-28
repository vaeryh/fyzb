local mt = {}

-- 英雄设计
mt.hero_designer = 'simliy'

-- 英雄触发
mt.hero_scripter = '上岸的鱼'

-- 英雄名称
mt.name = "聂风"

-- 物编ID
mt.id = 'Nf00'

-- 触发入口
gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.CHANGE_OWNER, function()
    if gU.isTypeId(GetTriggerUnit(), mt.id) then
        require 'hero.聂风.D'
        require 'hero.聂风.Q'
        require 'hero.聂风.W'
        require 'hero.聂风.E'
        require 'hero.聂风.R'
        gTrg.remove()
    end
end)

return mt
