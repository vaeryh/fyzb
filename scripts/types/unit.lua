local japi = require 'jass.japi'

local mt = {}

-- 类型
mt.type = "unit"

-- 单位状态
UNIT_STATE = {
    -- 生命值
    LIFE = UNIT_STATE_LIFE,
    -- 最大生命值
    MAX_LIFE = UNIT_STATE_MAX_LIFE,
    -- 魔法值
    MANA = UNIT_STATE_MANA,
    -- 最大魔法值
    MAX_MANA = UNIT_STATE_MAX_MANA,
    -- 护甲
    ARMOR = ConvertUnitState(0x20),
    -- 攻击范围
    ATK_RANGE = ConvertUnitState(0x16),
    -- 攻击间隔
    ATK_INTERVAL = ConvertUnitState(0x25),
    -- 攻击速度
    ATK_SPEED = ConvertUnitState(0x51),
    -- 基础伤害
    BASIC_DAMAGE = ConvertUnitState(0x12),
    -- 附加伤害
    ADD_DAMAGE = ConvertUnitState(0x13),
    -- 骰子数量
    DICE_NUM = ConvertUnitState(0x10),
    -- 骰子面数
    DICE_MNUM = ConvertUnitState(0x11)
}

-- 单位列表
mt.listUnit = {}

-- 创建单位
function mt.create(p, id, x, y, face)
    local x = x or log.error('坐标错误')
    local u = CreateUnit(p, gYh.s2id(id), x, y, face) or log.error(gYh.s2id(id))
    table.insert(mt.listUnit, u)
    return u
end

-- 创建N个单位
function mt.createNum(num, p, id, x, y, face)
    for i = 1, num do
        mt.create(p, id, x, y, face)
    end
end

-- 删除单位
function mt.remove(handle)
    RemoveUnit(handle)
end

-- 单位是否存活
function mt.is_alive(handle)
    return GetUnitState(handle, UNIT_STATE_LIFE) > 0
end

-- 获取单位坐标
function mt.getXY(u)
    return GetUnitX(u), GetUnitY(u)
end
-- 获取单位X坐标
function mt.getX(u)
    return GetUnitX(u)
end
-- 获取单位Y坐标
function mt.getY(u)
    return GetUnitY(u)
end

-- 立即移动单位到坐标
function mt.setPosition(u, x, y)
    SetUnitPosition(u, x, y)
end

-- 设置单位坐标（不打断单位当前动作）
function mt.setXY(u, x, y)
    SetUnitX(u, x)
    SetUnitY(u, y)
end

-- 获取单位状态
function mt.getState(u, unitState)
    return japi.GetUnitState(u, unitState, delta)
end

-- 设置单位状态
function mt.setState(u, unitState, delta)
    japi.SetUnitState(u, unitState, delta)
end

-- 调整单位状态
function mt.adjustState(u, unitState, delta)
    local newstate = mt.getState(u, unitState) + delta
    if newstate <= 0 then
        log.error('单位状态负值', unitState)
    end
    mt.setState(u, unitState, newstate)
end

-- 设置单位颜色
function mt.setVertexColor(u, red, green, blue, alpha)
    SetUnitVertexColor(u, red, green, blue, alpha)
end

-- 设置单位尺寸(u,1.0,1.0,1.0)
function mt.setScale(u, length, width, height)
    local width = width or length
    local height = height or length
    SetUnitScale(u, length, width, height)
end

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* 是否 *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- 是否盟军(包括中立状态,单向判断玩家对单位是否为不侵犯状态)
function mt.isAlly(u, p)
    return IsUnitAlly(u, p)
end
-- 是否敌军(不包括中立状态,单向判断玩家对单位是否为敌对侵犯)
function mt.isEnemy(u, p)
    return IsUnitEnemy(u, p)
end

-- 是否单位类型与ID一致
function mt.isTypeId(u, id)
    return GetUnitTypeId(u) == gYh.s2id(id)
end

-- 设置单位生命周期
function mt.setLifeTime(unit, time, id)
    local id = id or 'Bhwd' -- 水元素
    UnitApplyTimedLife(unit, gYh.s2id(id), time)
end

-- 设置碰撞开关(true:打开)
function mt.setPathing(unit, bol)
    SetUnitPathing(unit, bol)
end

-- 设置单位可以飞行(Amrf:乌鸦形态)
function mt.setFlyEnable(unit)
    gAbi.add(unit, 'Amrf')
    gAbi.remove(unit, 'Amrf')
end

-- 设置单位飞行高度、改变速率
function mt.setFlyHeight(unit, height, rate)
    SetUnitFlyHeight(unit, height, rate)
end

-- 设置单位true:无敌;false:可攻击的
function mt.setInvulnerable(unit, bol)
    SetUnitInvulnerable(unit, bol)
end

-- 设置单位面向角度
function mt.setFacing(unit, angle)
    SetUnitFacing(unit, angle)
end
-- 获取单位面向角度
function mt.getFacing(unit)
    GetUnitFacing(unit)
end

-- 获取单位默认移动速度
function mt.getDefaultMoveSpeed(unit)
    GetUnitDefaultMoveSpeed(unit)
end
-- 获取单位移动速度
function mt.getMoveSpeed(unit)
    GetUnitMoveSpeed(unit)
end
-- 设置单位移动速度
function mt.setMoveSpeed(unit, speed)
    SetUnitMoveSpeed(unit, speed)
end

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> +* 发布命令 *+ <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 发布无目标命令
function mt.issueOrder(unit, str)
    IssueImmediateOrder(unit, str)
end
-- 发布命令到坐标
function mt.issueOrderXY(unit, str, x, y)
    IssuePointOrder(unit, str, x, y)
end
-- 发布命令到目标(单位、物品、破坏物)
function mt.issueOrderTar(unit, str, tar)
    IssueTargetOrder(unit, str, tar)
end

-- 发布中介无目标命令
function mt.issueNeutralOrder(player,unit, str)
    IssueNeutralImmediateOrder(player,unit, str)
end
-- 发布中介命令到坐标
function mt.issueNeutralOrderXY(player,unit, str, x, y)
    IssueNeutralPointOrder(player,unit, str, x, y)
end
-- 发布中介命令到目标(单位、物品、破坏物)
function mt.issueNeutralOrderTar(player,unit, str, tar)
    IssueNeutralTargetOrder(player,unit, str, tar)
end

-- 单位类型
UNIT_TYPE = {
    -- 英雄
    HERO = UNIT_TYPE_HERO,
    -- 死亡的
    DEAD = UNIT_TYPE_DEAD,
    -- 建筑
    STRUCTURE = UNIT_TYPE_STRUCTURE,
    -- 飞行单位
    FLYING = UNIT_TYPE_FLYING,
    -- 地面单位
    GROUND = UNIT_TYPE_GROUND,
    -- 可攻击飞行物的单位
    ATTACKS_FLYING = UNIT_TYPE_ATTACKS_FLYING,
    -- 可攻击地面的单位
    ATTACKS_GROUND = UNIT_TYPE_ATTACKS_GROUND,
    -- 近程单位
    MELEE_ATTACKER = UNIT_TYPE_MELEE_ATTACKER,
    -- 远程单位
    RANGED_ATTACKER = UNIT_TYPE_RANGED_ATTACKER,
    -- 泰坦族
    GIANT = UNIT_TYPE_GIANT,
    -- 召唤单位
    SUMMONED = UNIT_TYPE_SUMMONED,
    -- 被枷锁的
    STUNNED = UNIT_TYPE_STUNNED,
    -- 附带瘟疫的
    PLAGUED = UNIT_TYPE_PLAGUED,
    -- 被束缚的
    SNARED = UNIT_TYPE_SNARED,
    -- 不死族
    UNDEAD = UNIT_TYPE_UNDEAD,
    -- 机械
    MECHANICAL = UNIT_TYPE_MECHANICAL,
    -- 工人
    PEON = UNIT_TYPE_PEON,
    -- 自爆工兵
    SAPPER = UNIT_TYPE_SAPPER,
    -- 城镇大厅
    TOWNHALL = UNIT_TYPE_TOWNHALL,
    -- 古树
    ANCIENT = UNIT_TYPE_ANCIENT,
    -- 牛头人
    TAUREN = UNIT_TYPE_TAUREN,
    -- 中毒的
    POISONED = UNIT_TYPE_POISONED,
    -- 被变形的
    POLYMORPHED = UNIT_TYPE_POLYMORPHED,
    -- 被催眠的
    SLEEPING = UNIT_TYPE_SLEEPING,
    -- 有抗性皮肤的
    RESISTANT = UNIT_TYPE_RESISTANT,
    -- 处于虚无状态的
    ETHEREAL = UNIT_TYPE_ETHEREAL,
    -- 魔法免疫的
    MAGIC_IMMUNE = UNIT_TYPE_MAGIC_IMMUNE
}

return mt
