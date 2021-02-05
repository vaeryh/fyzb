local slk = require 'jass.slk'

local mt = {}

local function func()
    print(slk)
    print(slk.item)
    print(slk.unit)
    print(slk.ability)
    print(slk.item.penr)
    print(slk.unit.hpea)
    print(slk.ability.Avul)
    print(slk.item.tfar.Name)
    for k, v in pairs(slk.ability.Avul) do
        print(k)
    end
end

local SLK_TYPE = {
    -- 单位
    UNIT = 'unit',
    -- 物品
    ITEM = 'item',
    -- 技能
    ABILITY = 'ability',
    -- buff
    BUFF = 'buff',
    -- 科技
    UPGRADE = 'upgrade',
    -- 装饰物
    DOODAD = 'doodad',
    -- 可破坏物
    DESTRUCTABLE = 'destructable'
}

-- 获取单位string
function mt.getUnitString(handle, pro)
    local id = gYh.id2s(GetUnitTypeId(handle))
    pro = slk.unit[id][pro] or log.warn('无效', id, handle, pro)
    return pro
end
-- 获取单位Int
function mt.getUnitInt(handle, pro)
    return tonumber(mt.getUnitString(handle, pro))
end
-- 获取物品string
function mt.getItemString(handle, pro)
    local id = gYh.id2s(GetItemTypeId(handle))
    pro = slk.item[id][pro] or log.warn('无效', handle, pro)
    return pro
end
-- 获取物品Int
function mt.getItemInt(handle, pro)
    return tonumber(mt.getItemString(handle, pro))
end
-- 获取技能string
function mt.getAbiString(handle, pro)
    local id = gYh.id2s(gYh.switch(handle))
    pro = slk.ability[id][pro] or log.warn('无效', handle, pro)
    return pro
end
-- 获取技能Int
function mt.getAbiInt(handle, pro)
    return tonumber(mt.getAbiString(handle, pro))
end

return mt
