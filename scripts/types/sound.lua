-- 声音
local mt = {}

-- 类型
mt.type = 'sound'

-- 播放音乐
function mt.PlayMusic(name)
    PlayMusic(name)
end

-- 播放声音
function mt.StartSound(name)
    StartSound(bj_victoryDialogSound)
end

-- 声音通道 Sound Constants
mt.VolumeGroup = {
    -- 动画和技能音效
    SPELLS = SOUND_VOLUMEGROUP_SPELLS,
    -- 环境音效
    AMBIENTSOUNDS = SOUND_VOLUMEGROUP_AMBIENTSOUNDS,
    -- 战斗音效
    COMBAT = SOUND_VOLUMEGROUP_COMBAT,
    -- 火焰音效
    FIRE = SOUND_VOLUMEGROUP_FIRE,
    -- 音乐
    MUSIC = SOUND_VOLUMEGROUP_MUSIC,
    -- 单位移动音效
    UNITMOVEMENT = SOUND_VOLUMEGROUP_UNITMOVEMENT,
    -- 单位回应音效
    UNITSOUNDS = SOUND_VOLUMEGROUP_UNITSOUNDS,
    -- 用户界面音效
    UI = SOUND_VOLUMEGROUP_UI
}

-- 设置多通道音量(0.00-1.00)
function mt.setVolumeGroupVolume(vgroup, scale)
    local scale = math.max(scale, 0.00)
    local scale = math.min(scale, 1.00)
    VolumeGroupSetVolume(vgroup, scale)
end

return mt
