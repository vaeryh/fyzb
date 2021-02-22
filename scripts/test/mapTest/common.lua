local mt = {}

-- 按键-命令合集
function mt.Init_A()
    -- 瞬间移动 Z
    gDz.TriggerRegisterKeyEvent(90, 0, true, function()
        local p = gDz.GetTriggerKeyPlayer()
        gYh.MoveAndCamera(Hero[p], gDz.GetMouseTerrainX(), gDz.GetMouseTerrainY())
    end)
end

-- 输入-命令合集
function mt.Init_B()
    -- 全屏
    gTrg.RegAnyPlayerChatEvent(GetEventPlayerChatString(), true, function()
        local enterString = GetEventPlayerChatString()
        local trgP = GetTriggerPlayer()
        if string.upper(enterString) == "开启全屏" then
            gFog.setBlackShadow(false)
            gFog.setWarDenseFog(false)
        end
        -- 字母转大写
        if string.upper(enterString) == "" then

        end
    end)
end

function mt.Init()
    mt.Init_A()
    mt.Init_B()
end

mt.Init()

return mt
