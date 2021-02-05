local japi = require 'jass.japi'

local mt = {}

-- 类型
mt.type = "effect"

EFFECT_TYPE = {
    -- 点目标效果
    EFFECT = EFFECT_TYPE_EFFECT,
    -- 目标效果
    TARGET = EFFECT_TYPE_TARGET,
    -- 施法者效果
    CASTER = EFFECT_TYPE_CASTER,
    -- 特殊效果
    SPECIAL = EFFECT_TYPE_SPECIAL,
    -- 区域效果
    AREA_EFFECT = EFFECT_TYPE_AREA_EFFECT,
    -- 投射物效果
    MISSILE = EFFECT_TYPE_MISSILE,
    -- 闪电效果
    LIGHTNING = EFFECT_TYPE_LIGHTNING
}

-- 附着点
AttachPoint = {
    -- head 头部，并随单位头部的动作而晃动
    head = "head",
    -- 头顶
    overhead = "overhead",
    -- chest 胸部 ，并随单位胸部动作而晃动
    chest = "chest"
    -- origin 预设，就是在单位的位置上，脚下的平面，不会晃动
    -- hand 手上（有时和在武器上很难分清）会随手动
    -- foot 脚上 会随脚动
    -- weapon 武器上 会随武器动一般在武器的半截位置或尖端
    -- sprite 游符，小精灵（只对建筑、机械单位及英雄血法有效）也就是围着血法转的球体，配合下面的first second third fourth fifth sixth使用，但不是所有建筑或机械都有这六个位置，这六个位置对于不同事物是不同的。用时可以自己测试。若没有修饰默认为first
    -- medium 中间（只对建筑有效）配合下面的first second third fourth fifth sixth使用，测试结果是最后一种部位有效。
    -- large 全体（只对建筑有效） 同上
    -- mount 坐骑（只对有坐骑的有效，说明的见下面举例）
    -- rear (对四足动物或有坐骑的有效)就是他们的屁股位置
    -- 部位位置修正：
    -- left 左边（如hand left＝左手，输入left hand也是）
    -- right 右边
    -- rallypoint 集结点，但是这个集结点是指默认集结点位置，不会随你在游戏中的点选而改变
    -- 具体搭配挺多大概有：
    -- left chest,right chest,left mount,right mount,left hand,right hand,left rear,right rear,mount rear,left foot,right foot,weapon left,weapon right
    -- 举例：拿人族骑士来说吧（因为他几乎所有部位俱全）特效是旗帜
    -- origin-在身体偏右侧地面上，会随骑士移动移动，单不受他的修饰性动作的影响
    -- hand＝right hand/hand right－在右手，手举起时旗帜会挥动
    -- left hand/hand left－在左手，同上
    -- head-在头上，扭头时旗帜也动(没有left head与right head)
    -- chest－向前进时胸部前倾，旗帜也是
    -- left chest=left mount=mount left=chest left、right chest=right mount=mount right=chest right:身体一侧，会随身动
    -- left/right:在左/右前腿，会随腿动而动
    -- rear=right rear:在右后腿（马的腿）
    -- left rear:在左后腿
    -- mount：在马头上
    -- mount rear 马屁股上
    -- foot= （right foot ）=right
    -- left foot=left
    -- weapon left(不可写left weapon):左手武器尖端
    -- weapon=weapon right:右手武器
}
-- 删除特效
function mt.remove(eff)
    DestroyEffect(eff)
end

-- 定时删除特效
function mt.removeTimer(timeout, eff)
    TimerStart(gT.create(), timeout, false, function()
        mt.remove(eff)
        gT.remove()
    end)
end

-- 新建特效(指定技能，创建到坐标)
function mt.addAbiXY(id, type, x, y)
    return AddSpellEffectById(gYh.s2id(id), type, x, y)
end
-- 新建特效(指定技能，创建到点)
function mt.addAbiLoc(id, type, loc)
    return AddSpellEffectByIdLoc(gYh.s2id(id), type, loc)
end
-- 新建特效(指定技能，创建到单位)
function mt.addAbiTarget(id, type, target, attachPoint)
    return AddSpellEffectTargetById(gYh.s2id(id), type, target, attachPoint)
end

-- 新建特效，创建到坐标
function mt.addXY(path, x, y)
    return AddSpecialEffect(path, x, y)
end
-- 新建特效，创建到点
function mt.addLoc(path, loc)
    return AddSpecialEffectLoc(path, loc)
end
-- 新建特效，创建到单位
function mt.addTarget(path, target, attachPoint)
    return AddSpecialEffectTarget(path, target, attachPoint)
end

-- 获取技能效果(序号0开始)
function mt.getAbi(id, effecttype, index)
    return GetAbilityEffectById(gYh.switch(id), effecttype, index)
end
---------------------------------------------------------------
-- 设置特效X轴缩放[ 1.00 ]，Y轴缩放[ 1.00 ]，Z轴缩放[ 1.00 ]
function mt.setScale(eff, x, y, z)
    local y = y or x
    local z = z or x
    japi.EXEffectMatScale(eff, x, y, z)
end

-- 设置特效动画播放速度
function mt.setSpeed(eff, speed)
    japi.EXSetEffectSpeed(eff, speed)
end

return mt
