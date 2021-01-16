-- local CJ = require "jass.common"
-- setmetatable( _G, { __index = CJ } )
-- 打印文本
printF = function(str, i)
    i = i or 0
    DisplayTimedTextToPlayer(Player(i), 0, 0, 20, str)
end

-- 单位归属玩家:单位,玩家ID
isPlayerUnit = function(ul, i)
    if i then
        return GetOwningPlayer(ul) == Player(i)
    else
        for i = 0, 15 do
            if GetOwningPlayer(ul) == Player(i) then
                return true
            end
        end
    end
    return false
end

-- 获取X、Y坐标
getX = function(ul)
    return isPlayerUnit(ul) and GetUnitX(ul) or GetLocationX(ul)
end
getY = function(ul)
    return isPlayerUnit(ul) and GetUnitY(ul) or GetLocationY(ul)
end

-- 计算两坐标角度
angleXY = function(x0, y0, x1, y1)
    return math.deg(math.atan(y1 - y0, x1 - x0))
end

-- 计算两坐标距离
distanceXY = function(x0, y0, x1, y1)
    return math.sqrt((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1))
end

-- 创建单位:单位,召唤物ID,创建位置,朝向角度
crtUnit = function(u, uid, ul, rface)
    local r = rface or GetUnitFacing(u)
    ul = not ul and u or ul
    return CreateUnit(GetOwningPlayer(u), ToId(uid), getX(ul), getY(ul), r)
end

-- 单位类型判断:单位,单位ID
unitType = function(u, uid)
    return GetUnitTypeId(u) == ToId(uid)
end

-- 单位具有生命/魔法:单位,判断字符
unitState = function(u, str)
    return str == "mana" and GetUnitState(u, UNIT_STATE_MANA) > 0 or GetUnitState(u, UNIT_STATE_LIFE) > 0
end

-- 施法技能为ablty
isAblty = function(ablty)
    return GetSpellAbilityId() == ToId(ablty)
end

-- 获取等级:单位,技能ID
getLvl = function(u, ablty)
    local ulvl = IsUnitType(u, UNIT_TYPE_HERO) and GetHeroLevel(u) or GetUnitLevel(u)
    return ablty and GetUnitAbilityLevel(u, ToId(ablty)) or ulvl
end

-- 设置等级:要设置技能的单位,要处理的技能ID,主单位/指定级别,主技能ID
setLvl = function(u, ablty, uolvl, aolvl)
    if not aolvl then
        return type(uolvl) == "number" and SetUnitAbilityLevel(u, ToId(ablty), uolvl) or
                   SetUnitAbilityLevel(u, ToId(ablty), getLvl(uolvl))
    end
    return SetUnitAbilityLevel(u, ToId(ablty), getLvl(uolvl, aolvl))
end

-- 设置生命周期:单位,时间
setAlive = function(u, t)
    UnitApplyTimedLife(u, 'BTLF', t)
end

-- 增删技能:(单位,要添加的技能ID)/(要删除的技能ID/单位)
aorAblty = function(u, id)
    return type(id) == "string" and UnitAddAbility(u, ToId(id)) or UnitRemoveAbility(id, ToId(u))
end

backHome = function(u, e) -- 回城:单位,特效
    SetUnitPosition(u, 0, 0)
    if not e then
        DestroyEffect(getEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", u))
    else
        DestroyEffect(getEffect(e, u, "origin"))
    end
    if isAsync(GetPlayerId(GetOwningPlayer(u))) then
        PanCameraToTimed(-0, 0, 0)
    end
end

-- 新建单位组:单位组,选取中心,选取范围
getGroup = function(g, ul, d)
    GroupEnumUnitsInRange(g, getX(ul), getY(ul), d, nil)
    return g
end

-- 排泄:杀死单位,移除点,摧毁特效
nilAll = function(...)
    local arg = {...}
    for k, v in pairs(arg) do
        if isPlayerUnit(v) then
            KillUnit(v)
        else
            if getX(v) ~= 0 and getY(v) ~= 0 then
                RemoveLocation(v)
            else
                DestroyEffect(v)
            end
        end
    end
    arg = nil
end

-- 设置飞行:单位,高度,速度
setFly = function(u, h, v)
    aorAblty(u, 'Arav')
    aorAblty('Arav', u)
    local speed = v or 0
    local high = h or 90
    SetUnitFlyHeight(u, high, speed)
end

-- 浮空:单位,最大高度
floating = function(u, h)
    local high = 0
    TimerStart(CreateTimer(), 0.03, true, function()
        if high <= h then
            if GetUnitState(u, UNIT_STATE_LIFE) > 0 then
                setFly(u, high)
            end
            high = high + 21
        else
            if GetUnitState(u, UNIT_STATE_LIFE) > 0 then
                setFly(u, 0, 500)
            end
            overT(GetExpiredTimer())
        end
    end)
end

-- 创建特效:路径,单位/位置,附着点
getEffect = function(str, ul, attach)
    return attach and AddSpecialEffectTarget(str, ul, attach) or AddSpecialEffect(str, getX(ul), getY(ul))
end

-- 创建延时特效:特效,时间
effDestroyLater = function(e, t)
    TimerStart(CreateTimer(), t, false, function()
        DestroyEffect(e)
        overT(GetExpiredTimer())
    end)
end

-- 创建随机位置特效:路径,中心位置,范围,时间
effRandomLoc = function(str, ul, r, t)
    local x, y = getX(ul) + math.random(r) * math.cos(math.rad(math.random(360))),
        getY(ul) + math.random(r) * math.sin(math.rad(math.random(360)))
    do
        if t then
            effDestroyLater(AddSpecialEffect(str, x, y), t)
        else
            DestroyEffect(AddSpecialEffect(str, x, y))
        end
    end
end

-- 恢复动画
recAm = function(u)
    SetUnitTimeScale(u, 1)
    SetUnitAnimation(u, "stand")
end

-- 结束计时器
overT = function(t, bool)
    if not bool then
        PauseTimer(t)
    end
    DestroyTimer(t)
end

-- 排泄单位组
overG = function(g)
    GroupClear(g)
    DestroyGroup(g)
end

-- 异步
isAsync = function(i)
    return Player(i) == GetLocalPlayer()
end

-- 判断作用对象:对象,己方,表
isTarget = function(a, b, tbl)
    if not tbl[a] and not IsUnitAlly(a, GetOwningPlayer(b)) and GetUnitState(a, UNIT_STATE_LIFE) > 0 and
        not IsUnitType(a, UNIT_TYPE_STRUCTURE) then
        tbl[a] = a;
        return true
    end
    return false
end

-- 随机单位
randomUnit = function(g)
    local g0 = CreateGroup()
    local i = 0
    local tbl = {}
    ForGroup(g, function()
        GroupAddUnit(g0, GetEnumUnit())
    end)
    while FirstOfGroup(g0) do
        i = i + 1
        tbl[i] = FirstOfGroup(g0)
        GroupRemoveUnit(g0, FirstOfGroup(g0))
    end
    GroupClear(g0)
    DestroyGroup(g0)
    if i > 0 then
        return tbl[math.random(i)]
    else
        return nil
    end
end

-- 位移炮弹对方向:炮弹,方向,速度
missileLine = function(u, r, v)
    r = math.rad(r)
    local x, y = GetUnitX(u) + v * math.cos(r), GetUnitY(u) + v * math.sin(r)
    SetUnitPosition(u, x, y)
end

-- 位移炮弹对目标:炮弹,目标,速度
missileTarget = function(u, ul, v)
    missileLine(u, angleXY(GetUnitX(u), GetUnitY(u), getX(ul), getY(ul)), v)
end

-- 注册事件
local BJ = {}
BJ.bj_MAX_PLAYER_SLOTS = 16
BJ.TriggerRegisterAnyUnitEvent = function(trig0, event)
    for i = 0, BJ.bj_MAX_PLAYER_SLOTS - 1 do
        TriggerRegisterPlayerUnitEvent(trig0, Player(i), event, nil)
    end
end
return BJ
