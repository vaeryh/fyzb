local japi = require 'jass.japi'

local mt = {}

ITEM_DATA = {
    -- 提示string
    TIP = 4,
    -- 提示扩展string
    UBERTIP = 3,
    -- 图标string
    ART = 1
}
-- 设置属性
function mt.setDataString(itemcode, data_type, value)
    itemcode = GetItemTypeId(itemcode)
    japi.EXSetItemDataString(itemcode, data_type, value)
end
-- 获取属性
function mt.getDataString(itemcode, data_type)
    itemcode = GetItemTypeId(itemcode)
    return japi.EXGetItemDataString(itemcode, data_type)
end
-- 物品类型
ITEM_TYPE = {
    -- 永久
    PERMANENT = ITEM_TYPE_PERMANENT,
    -- 可充的
    CHARGED = ITEM_TYPE_CHARGED,
    -- 能量提升
    POWERUP = ITEM_TYPE_POWERUP,
    -- 人造
    ARTIFACT = ITEM_TYPE_ARTIFACT,
    -- 可购买
    PURCHASABLE = ITEM_TYPE_PURCHASABLE,
    -- 战役
    CAMPAIGN = ITEM_TYPE_CAMPAIGN,
    -- 混杂
    MISCELLANEOUS = ITEM_TYPE_MISCELLANEOUS,
    -- 未知
    UNKNOWN = ITEM_TYPE_UNKNOWN,
    -- 任何
    ANY = ITEM_TYPE_ANY
}

-- 列表
mt.listItem = {}

function mt:reload()
    for k, v in ipairs(self.listItem) do
        mt.remove(v)
    end
    log.debug("item", #self.listItem)
end

-- 创建物品
function mt.create(id, x, y)
    local item = CreateItem(gYh.switchId(id), x, y)
    table.insert(mt.listItem, item)
    return item
end

-- 获取指定分类的随机物品(新版等级参考)
function mt.getRandom(itemtype, lev)
    return ChooseRandomItemEx(itemtype, lev)
end

-- 删除物品
function mt.remove(item)
    RemoveItem(item)
end
-- 丢弃物品
function mt.drop(unit, item)
    UnitRemoveItem(unit, item)
end
-- 给与物品
function mt.addUnit(unit, item)
    UnitAddItem(unit, item)
end
-- 移动物品到槽位号
function mt.moveUnitSlot(unit, item, solt)
    UnitDropItemSlot(unit, item, solt)
end
-- 获取等级
function mt.getLevel(item)
    return GetItemLevel(item)
end
-- 获取类型
function mt.getTypeId(item)
    return GetItemTypeId(item)
end
-- 获取物品坐标
function mt.getXY(item)
    return GetItemX(item), GetItemY(item)
end

-- 设置可见度(true:可见)
function mt.setVisible(item, bol)
    SetItemVisible(item, bol)
end
-- 获取可见度(true:可见)
function mt.isVisible(item, bol)
    return IsItemVisible(item)
end
-- 物品所有者
-- native IsItemOwned takes item whichItem returns boolean
function mt.isOwned(item)
    return IsItemOwned(item)
end

-- 物品是拾取时自动使用的 [R]
-- native IsItemPowerup takes item whichItem returns boolean
function mt.isPowerup(item)
    return IsItemPowerup(item)
end
-- 物品可被市场随机出售 [R]
-- native IsItemSellable takes item whichItem returns boolean
function mt.isSellable(item)
    return IsItemSellable(item)
end
-- 物品可被抵押 [R]
-- native IsItemPawnable takes item whichItem returns boolean
function mt.isPawnable(item)
    return IsItemPawnable(item)
end

-- 物品类型是拾取时自动使用的 [R]
-- native IsItemIdPowerup takes integer itemId returns boolean
function mt.IsItemIdPowerup(itemId)
    return IsItemIdPowerup(itemId)
end
-- 物品类型可被市场随机出售 [R]
-- native IsItemIdSellable takes integer itemId returns boolean
function mt.isIdSellable(itemId)
    return IsItemIdSellable(itemId)
end
-- 物品类型可被抵押 [R]
-- native IsItemIdPawnable takes integer itemId returns boolean
function mt.isIdPawnable(itemId)
    return IsItemIdPawnable(itemId)
end

-- 设置物品坐标
function mt.setPosition(item, x, y)
    SetItemPosition(item, x, y)
end
-- 设置生命值
function mt.setWidgetLife(item, life)
    SetWidgetLife(item, life)
end

-- 设置使用次数
function mt.setCharges(item, num)
    SetItemCharges(item, num)
end
-- 获取使用次数
function mt.getCharges(item)
    return GetItemCharges(item)
end

-- 设置(true:无敌,false:可攻击的)
function mt.setInvulnerable(item, bol)
    SetItemInvulnerable(item, bol)
end
-- 设置抵押(true:可以)
function mt.setPawnable(item, bol)
    SetItemPawnable(item, bol)
end

-- 设置丢弃(true:允许)
function mt.setDroppable(item, bol)
    SetItemDroppable(item, bol)
end
-- 设置持有者死亡掉落
function mt.setDropOnDeath(item, bol)
    SetItemDropOnDeath(item, bol)
end
-- 设置物品所属玩家(true:改变颜色)
function mt.setPlayer(item, p, bol)
    SetItemPlayer(item, p, bol)
end

-- 是否匹配类型ID
function mt.isMatchTypeId(item, id)
    if type(id) == 'number' then
        return GetItemTypeId(item) == id
    elseif type(id) == 'string' then
        return GetItemTypeId(item) == gYh.s2id(id)
    end
end
-- 获取槽位号物品
function mt.getUnitInSlot(unit, index)
    local item = UnitItemInSlot(unit, index)
    if item == 0 then
        return nil
    end
    return item
end
-- 获取槽位号
function mt.getHaveItemTypeCount(unit, itemId)
    local index = 0
    for i = 0, 5 do
        local indexItem = mt.getUnitInSlot(unit, i)
        if indexItem ~= nil and mt.isMatchTypeId(indexItem, itemId) then
            index = index + 1
        end
    end
    return index
end
-- 单位持有物品类型
function mt.isHave(unit, itemId)
    return mt.getHaveItemTypeCount(unit, itemId) > 0
end

-- 获取背包同类别的物品数量
function mt.getSameClassNum(whichUnit, class)
    local num = 0
    for i = 0, 5 do
        local item = mt.getUnitInSlot(whichUnit, i)
        if item and gSlk.getItemString(item, "class") == class then
            num = num + 1
        end
    end
    return num
end

-- 获取物品栏物品数量
function mt.getBarNum(whichUnit)
    local num = 0
    for i = 0, 5 do
        local item = mt.getUnitInSlot(whichUnit, i)
        if item then
            num = num + 1
        end
    end
    return num
end

return mt
