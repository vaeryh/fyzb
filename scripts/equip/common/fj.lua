local zb = require 'equip.common.zb'

local mt = {}
setmetatable(mt, zb)
mt.__index = mt

-- 类别
mt.class = "防具"

-- 性别是否不满足
function mt.holdlimit_Sex()
    gTrg.RegUserPlayerUnitEvent(EVENT_PLAYER_UNIT.PICKUP_ITEM, function()
        local hero, item = GetTriggerUnit(), GetManipulatedItem()
        --
        print('sex', mt:inherit(item), mt.class, mt:inherit(item).class)
        if mt:inherit(item):isHaveFather(mt.class) then
            local oldLevel = gSlk.getItemInt(item, "oldLevel")
            print('性别', oldLevel, gU.isTypeId(hero, 'Fw00'))
            -- 男
            if oldLevel == 1 and gU.isTypeId(hero, 'Fw00') then -- 男
                local text = "虽然" .. GetUnitName(hero) .. "你是美女，也不可以穿男装哦~~~~"
                gP.disTimedText(gU.getOwner(hero), 15.00, text)
                gIt.drop(hero, item)
            end
            -- 女
            if oldLevel == 0 and not gU.isTypeId(hero, 'Fw00') then
                gP.disTimedText(gU.getOwner(hero), 15.00, "莫非你是女装大佬？？？~~~~")
                gIt.drop(hero, item)
            end
        end
    end)
end

-- 自身初始化
function mt.selfInit()

end

mt:printParentClass()
mt:source_shop()
mt.holdlimit_Sex()

return mt
