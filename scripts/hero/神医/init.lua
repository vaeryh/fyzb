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
        require 'hero.神医.D'
        require 'hero.神医.Q'
        require 'hero.神医.W'
        require 'hero.神医.E'
        require 'hero.神医.R'
        -- require 'hero.神医.tlA'
        -- require 'hero.神医.tlB'
        -- require 'hero.神医.tlC'
        gTrg.remove()
    end
end)

return mt
