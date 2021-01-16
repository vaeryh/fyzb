local p = require 'types.player'

local mt = {}

-- 转换256进制整数
function mt.s2id(a) -- 转为id
    local n1 = string.byte(a, 1) or 0
    local n2 = string.byte(a, 2) or 0
    local n3 = string.byte(a, 3) or 0
    local n4 = string.byte(a, 4) or 0
    local r = n1 * 256 * 256 * 256 + n2 * 256 * 256 + n3 * 256 + n4
    return r
end

-- 转为string
function mt.id2s(a)
    local s1 = math.floor(a / 256 / 256 / 256) % 256
    local s2 = math.floor(a / 256 / 256) % 256
    local s3 = math.floor(a / 256) % 256
    local s4 = a % 256
    local r = string.char(s1, s2, s3, s4)
    return r
end

-- 平移镜头+移动单位（坐标，免排泄）
function mt.MoveAndCamera(whichHero, x, y)
    local abi = mt.s2id('AHmt')
    -- 开始特效
    --- 施法者
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_CASTER, whichHero, "origin"))
    --- 区域
    DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_AREA_EFFECT, whichHero, "origin"))
    -- 开启计时器
    TimerStart(CreateTimer(), 0.77, false, function()
        -- 设置单位坐标
        SetUnitPosition(whichHero, x, y)
        -- 结束特效
        ---- 特殊效果
        DestroyEffect(AddSpellEffectTargetById(abi, EFFECT_TYPE_SPECIAL, whichHero, "origin"))
        -- 移动镜头
        if p.isLocalPlayer(whichHero) then
            PanCameraToTimed(x, y, 0.33)
            SelectUnit(whichHero, true) -- 细节：移动镜头后玩家选择一下单位
        end
        DestroyTimer(GetExpiredTimer())
    end)
end

return mt
