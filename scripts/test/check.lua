local mapg = require 'map.global'
local mt = {}

-- local frame = gDz.CreateFrameByTagName("BACKDROP", nil, nil)
-- gDz.FrameSetSize(frame, 0.03, 0.04)
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.516, 0.111)
-- gDz.FrameSetTexture(frame,'ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp',0)

gTrg.RegAnyPlayerUnitEvent(EVENT_PLAYER_UNIT.SELECTED, function()
    local unit = GetTriggerUnit()
    local path = mapg.sound.MouseClick1
    --gSound.PlaySoundUI(mapg.sound.HeroDropItem1, 127)
    -- local sound = gSound.create(path, false, true, true, 10, 10, "SpellsEAX")
    -- gSound.setPosition(sound, gU.getXY(unit))
    -- gSound.StartSound(sound)
end)

-- local frame = gDz.CreateFrameByTagName("BUTTON", nil, nil, "BagButton")
-- gDz.FrameSetAbsolutePoint(frame, 0, 0.2, 0.4)
-- -- local back = gDz.CreateFrameByTagName("BACKDROP")
-- -- gDz.FrameSetAllPoints(back, frame)
-- gDz.TriggerRegisterUIEvent(frame, 2, mt.act())

-- function mt.act()
--     printF("进入", gDz.GetTriggerUIEventFrame())
-- end
