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

-- 获取单位物编数据
function mt.getDataUnit(handle, pro)
    local id = gYh.id2s(handle)
    local pro = slk.unit[id][pro] or log.error('无效',handle, pro)
    return pro
end
-- 获取物品物编数据
function mt.getDataItem(handle, pro)
    local id = gYh.id2s(handle)
    local pro = slk.item[id][pro] or log.error('无效', handle, pro)
    return pro
end
-- 获取技能物编数据
function mt.getDataAbi(handle, pro)
    local id = gYh.id2s(handle)
    local pro = slk.ability[id][pro] or log.error('无效', handle, pro)
    return pro
end
-- gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
--     local unit = GetTriggerUnit()
--     print(mt.getData(SLK_TYPE.UNIT, unit, 'Tip'))
-- end)

return mt
