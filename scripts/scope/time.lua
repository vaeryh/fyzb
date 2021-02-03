local dz = require 'library.BlizzardAPI'

if not dz then
    return
end

-- 星期
local weekday = {"日", "一", "二", "三", "四", "五", "六"}
-- 创建左上角时间标记
gTrg.RegTimerEvent(0.00, false, function()
    local frame = dz.CreateFrameByTagName("TEXT")
    dz.FrameSetAbsolutePoint(frame, 0, 0.0487, 0.5633)
    dz.FrameSetSize(frame, 0.15, 0.01)
    dz.FrameShow(frame, true)
    TimerStart(gT.create(), 1.00, true, function()
        local text = os.date("%Y年%m月%d日 %H:%M:%S 星期") .. weekday[os.date("%w") + 1]
        dz.FrameSetText(frame, "|cffff0000" .. text)

        -- DestroyTimer(GetExpiredTimer())
    end)

    gTrg.remove()
end)
