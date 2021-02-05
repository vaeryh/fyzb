-- 星期
local weekday = {"日", "一", "二", "三", "四", "五", "六"}

-- 创建左上角时间标记
gTrg.RegTimerEvent(0.00, false, function()
    local frame = gDz.CreateFrameByTagName("TEXT")
    gDz.FrameSetAbsolutePoint(frame, 0, 0.0487, 0.5633)
    gDz.FrameSetSize(frame, 0.15, 0.01)
    gDz.FrameShow(frame, true)
    gT.loop(1.00, function()
        local text = os.date("%Y年%m月%d日 %H:%M:%S 星期") .. weekday[os.date("%w") + 1]
        gDz.FrameSetText(frame, "|cffff0000" .. text)

        -- DestroyTimer(GetExpiredTimer())
    end)

    gTrg.remove()
end)
