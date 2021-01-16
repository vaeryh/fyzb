local g = require 'jass.globals'
local rect = require 'types.rect'
local camera = require 'types.camera'
local trg = require 'types.trigger'
local p = require 'types.player'
local fog = require 'types.fogmodifier'
local yh = require 'types.yh'
local jass = require 'jass.common'

Hero = {}
-----------------------------------------------------------------------------
local mt = {}

-- 选择矩形
mt['选择英雄矩形'] = jass.gg_rct_FirstHeroSelection
mt['主城矩形'] = jass.gg_rct_TheMainBase
mt['回城矩形'] = jass.gg_rct_HG

-- 复活英雄
local ReHero = trg.createTrigger(function()
    local tmr = CreateTimer()
    local twd = CreateTimerDialog(tmr)
    local thisHero = GetTriggerUnit()
    local Lev = GetHeroLevel(thisHero)

    if Lev >= 10 then
        Lev = 10
    end
    TimerDialogSetTitle(twd, GetUnitName(thisHero) .. "复活时间倒计时") -- title
    TimerDialogDisplay(twd, true) -- display显示 twd

    TimerStart(tmr, Lev, false, function()
        TimerDialogDisplay(twd, false)
        ReviveHero(thisHero, -100, -100, true) -- revive hero
        -- -- 移动镜头
        if p.isLocalPlayer(p.getOwning(thisHero)) then
            PanCameraToTimed(-100, -100, 0.33)
            SelectUnit(thisHero, true) -- 细节：移动镜头后玩家选择一下单位
        end
        DestroyTimerDialog(twd)
        DestroyTimer(GetExpiredTimer())
    end)
end)

-----------------------------------------------------------------------------

-- 双击选择英雄:每个玩家注册一个触发：用完就删除，保证1个选择英雄
local trig = trg.createTrigger(function()
    local thisP = GetTriggerPlayer()
    local thisU = GetTriggerUnit()

    if GetUnitUserData(thisU) == GetPlayerId(thisP) + 1 then
        DisplayTimedTextToPlayer(thisP, 0, 0, 20, GetPlayerName(thisP) .. "选择了" .. GetUnitName(thisU) .. '!')
        SetUnitOwner(thisU, thisP, true) -- 改变单位所属为触发玩家
        -- SetHeroLevel(thisU, 15, false)
        -- 记录玩家英雄
        Hero[thisP] = thisU
        -- 添加 触发单位死亡 事件
        -- 设置可用区域
        -- 启用- 新建可见度修正器，盟友共享视野，不覆盖单位视野
        fog.start(fog.createFog(GetTriggerPlayer(), mt['主城矩形']))
        -- 设置玩家可用地图区域=默认可用地图区域
        if GetLocalPlayer() == GetTriggerPlayer() then
            camera.setCameraBounds(rect.getAbleArea)
        end
        -- 传送
        yh.MoveAndCamera(thisU,rect.getCenter(mt['回城矩形']))
        -- 添加 触发单位死亡 事件
        TriggerRegisterUnitEvent(ReHero, thisU, EVENT_UNIT_DEATH)
        -- 删除触发
        trg.remove()
    else
        SetUnitUserData(thisU, GetPlayerId(thisP) + 1) -- 设置单位自定义值为触发玩家ID
        TimerStart(CreateTimer(), 0.33, false, function()
            SetUnitUserData(thisU, 0)
            DestroyTimer(GetExpiredTimer())
        end)
    end
end)
for i = 0, 11 do
    if p.isUserPlayer(i) then
        TriggerRegisterPlayerUnitEvent(trig, Player(i), EVENT_PLAYER_UNIT_SELECTED, nil)
    end
end

-----------------------------------------------------------------------------
