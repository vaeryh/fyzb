-- 声音
local mt = {}

-- 类型
mt.type = 'sound'

-- 声音类型
SOUND_TYPE = {
    -- 普通
    EFFECT = SOUND_TYPE_EFFECT,
    -- 循环
    EFFECT_LOOPED = SOUND_TYPE_EFFECT_LOOPED
}

-- 声音通道 Sound Constants
SOUND_VOLUMEGROUP = {
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
-- 声音效果
eax = {
    -- 魔法
    magic = 'SpellsEAX'
}

-- //============================================================================
-- // Sound API
-- //
-- native NewSoundEnvironment          takes string environmentName returns nothing

-- native CreateSound                  takes string fileName, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate, string eaxSetting returns sound
-- 创建音效(路径、是否循环、是否3D,超出范围停止、淡入速率、淡出速率、效果类型)
-- CreateSound("yequ.mp3", false, false, false, 10, 10, "")
function mt.create(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, eaxSetting)
    looping = looping or false
    is3D = is3D or false
    stopwhenoutofrange = stopwhenoutofrange or false
    fadeInRate = fadeInRate or 10
    fadeOutRate = fadeOutRate or 10
    eaxSetting = eaxSetting or ''
    return CreateSound(fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, eaxSetting)
end
-- native CreateSoundFilenameWithLabel takes string fileName, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate, string SLKEntryName returns sound
-- native CreateSoundFromLabel         takes string soundLabel, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate returns sound
-- native CreateMIDISound              takes string soundLabel, integer fadeInRate, integer fadeOutRate returns sound

-- native SetSoundParamsFromLabel      takes sound soundHandle, string soundLabel returns nothing
-- 设置来自标签的声音参数
-- call SetSoundParamsFromLabel(sound, "HealingWardBirth")
function mt.setParamsFromLabel(sound, lable)
    SetSoundParamsFromLabel(sound, lable)
end
-- native SetSoundDistanceCutoff       takes sound soundHandle, real cutoff returns nothing
-- native SetSoundChannel              takes sound soundHandle, integer channel returns nothing
-- 设置音效通道
function mt.setChannel(sound, index)
    SetSoundChannel(sound, index)
end
-- native SetSoundVolume               takes sound soundHandle, integer volume returns nothing
-- 设置音效音量(0-127)
function mt.setVolume(sound, volume)
    SetSoundVolume(sound, volume)
end
-- native SetSoundPitch                takes sound soundHandle, real pitch returns nothing
-- 设置音效速率(表示正常速率的倍数)
function mt.setPitch(sound, pitch)
    SetSoundPitch(sound, pitch)
end

-- // the following method must be called immediately after calling "StartSound"
-- native SetSoundPlayPosition         takes sound soundHandle, integer millisecs returns nothing

-- // these calls are only valid if the sound was created with 3d enabled
-- native SetSoundDistances            takes sound soundHandle, real minDist, real maxDist returns nothing
-- native SetSoundConeAngles           takes sound soundHandle, real inside, real outside, integer outsideVolume returns nothing
-- native SetSoundConeOrientation      takes sound soundHandle, real x, real y, real z returns nothing
-- native SetSoundPosition             takes sound soundHandle, real x, real y, real z returns nothing
-- 设置播放位置为(0.00,0.00), Z轴高度为 0.00
function mt.setPosition(sound, x, y, z)
    z = z or 0
    SetSoundPosition(sound, x, y, z)
end
-- native SetSoundVelocity             takes sound soundHandle, real x, real y, real z returns nothing
-- native AttachSoundToUnit            takes sound soundHandle, unit whichUnit returns nothing

-- native StartSound                   takes sound soundHandle returns nothing
-- 播放音效
function mt.StartSound(sound)
    StartSound(sound)
end
-- native StopSound                    takes sound soundHandle, boolean killWhenDone, boolean fadeOut returns nothing
-- native KillSoundWhenDone            takes sound soundHandle returns nothing

-- // Music Interface. Note that if music is disabled, these calls do nothing
-- native SetMapMusic                  takes string musicName, boolean random, integer index returns nothing
-- native ClearMapMusic                takes nothing returns nothing

-- native PlayMusic                    takes string musicName returns nothing
-- 播放音乐
function mt.PlayMusic(name)
    PlayMusic(name)
end
-- native PlayMusicEx                  takes string musicName, integer frommsecs, integer fadeinmsecs returns nothing、
-- 播放音乐(从毫秒起 - 淡入毫秒)
function mt.PlayMusicEx(name, frommsecs, fadeinmsecs)
    PlayMusicEx(name, frommsecs, fadeinmsecs)
end
-- native StopMusic                    takes boolean fadeOut returns nothing
-- native ResumeMusic                  takes nothing returns nothing

-- native PlayThematicMusic            takes string musicFileName returns nothing
-- native PlayThematicMusicEx          takes string musicFileName, integer frommsecs returns nothing
-- native EndThematicMusic             takes nothing returns nothing

-- native SetMusicVolume               takes integer volume returns nothing
-- native SetMusicPlayPosition         takes integer millisecs returns nothing
-- native SetThematicMusicPlayPosition takes integer millisecs returns nothing

-- // other music and sound calls
-- native SetSoundDuration             takes sound soundHandle, integer duration returns nothing
-- 设置音效持续时间(03:13:123|分:秒：毫秒换算3min*60s+13s..123ms=193123)
function mt.setDuration(sound, dur)
    SetSoundDuration(sound, dur)
end
-- native GetSoundDuration             takes sound soundHandle returns integer
-- native GetSoundFileDuration         takes string musicFileName returns integer

-- native VolumeGroupSetVolume         takes volumegroup vgroup, real scale returns nothing
-- 设置多通道音量(0.00-1.00)
function mt.setVolumeGroupVolume(vgroup, scale)
    local scale = math.max(scale, 0.00)
    local scale = math.min(scale, 1.00)
    VolumeGroupSetVolume(vgroup, scale)
end
-- native VolumeGroupReset             takes nothing returns nothing

-- native GetSoundIsPlaying            takes sound soundHandle returns boolean
-- native GetSoundIsLoading            takes sound soundHandle returns boolean

-- native RegisterStackedSound         takes sound soundHandle, boolean byPosition, real rectwidth, real rectheight returns nothing
-- native UnregisterStackedSound       takes sound soundHandle, boolean byPosition, real rectwidth, real rectheight returns nothing

--=================================================================================================================================

-- 获取技能声音
function mt.getAbi(abiid, soundType)
    return GetAbilitySoundById(gYh.switch(abiid), soundType)
end

-- 创建音效
function mt.new(fileName, dur)
    local sound = mt.create(fileName)
    -- 设置音效长度
    mt.setDuration(sound, dur)
    -- 设置声音通道
    mt.setChannel(sound, 0)
    -- 设置音效音量
    mt.setVolume(sound, 127)
    -- 设置音效速率
    mt.setPitch(sound, 1.0)
end

return mt
