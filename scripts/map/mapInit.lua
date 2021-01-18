local camera = require 'types.camera'
local rect = require 'types.rect'
local sound = require 'types.sound'
local fog = require 'types.fogmodifier'
local trg = require 'types.trigger'
local jass = require 'jass.common'
local timer = require 'types.timer'

local mt = {}

-- 矩形
mt['选择英雄矩形'] = jass.gg_rct_FirstHeroSelection

-- 音乐
mt['选择英雄音乐'] = jass.gg_snd_Zandy01
mt['基地附近音乐'] = jass.gg_snd_FezdYezf01

-- 可见度修正器
mt.initfog = 0

-- 选择区域内单位
function GetUnitsInRectMatching(r)
    local g = CreateGroup()
    GroupEnumUnitsInRect(g, r, nil)
    DestroyBoolExpr(nil)
    return g
end

-- 进入地图触发动作
trg.CreateTrigger()
trg.RegTimerEvent(0.00, false, function()
    -- 创建可见度修正器
    mt.initfog = fog.createFog(Player(0), mt['选择英雄矩形'])
    fog.start(mt.initfog)
    camera.setCameraBounds(mt["选择英雄矩形"])
    sound.PlayMusic(mt['选择英雄音乐'])

    mt.func1()
    trg.remove()
end)

function mt.func1()
    -- 打开 玩家12 给予奖励
    SetPlayerState(Player(11), PLAYER_STATE_GIVES_BOUNTY, 1)
    -- 启用计时器
    TimerStart(CreateTimer(), 30.00, false, function()
        -- 播放背景音乐
        sound.PlayMusic(mt['基地附近音乐'])
        -- 删除未选取英雄
        local whichGroup
        local whichUnit
        whichGroup = GetUnitsInRectMatching(mt["选择英雄矩形"])
        for i = 1, 10 do
            whichUnit = FirstOfGroup(whichGroup)
            GroupRemoveUnit(whichGroup, whichUnit)
            if GetOwningPlayer(whichUnit) == Player(15) then
                RemoveUnit(whichUnit)
            end
        end
        -- 删除单位组
        DestroyGroup(whichGroup)
        -- 删除可见度修正器
        fog.stop(mt.initfog)
        -- 设置玩家可用地图区域
        if Hero[GetLocalPlayer()] == nil then
            camera.setCameraBounds(rect.getAbleArea)
        end
        -- 清除计时器
        timer.remove()
    end)
end
