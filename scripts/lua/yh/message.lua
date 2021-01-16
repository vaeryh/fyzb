local message = require 'jass.message'
local unit= require 'types.unit'

if not message then
    return
end
local keyboard = message.keyboard

function message.order_enable_debug(msg)
    print(msg)
end
-- 本地选择单位
--[[ TimerStart(CreateTimer(), 1.00, true, function()
    local selection = message.selection()
    print(selection)
    printF(GetUnitName(selection))
    print(keyboard['A'])
    -- DestroyTimer(GetExpiredTimer())
end) ]]

-- 本地消息
function message.hook(msg)
    local selection = message.selection()
    -- print(msg.type)
    -- print(msg.code)
    -- print(msg.state)
    -- 键盘抬起消息
    if msg.type == 'key_up' then
        if msg.code == keyboard['F2'] then
            yh.MoveAndCamera(selection, math.random(0, 2000), math.random(0, 2000))
            return true
        end
        --重载ESC
        if msg.code == 512 then
            reload()
            return true
        end
    end
    -- 键盘按下消息
    if msg.type == 'key_down' then
        if msg.code == keyboard['F3'] then

            return true
        end
        if msg.code == keyboard['Z'] then
            unit.setUnitXY(selection,message.mouse())
            return true
        end
    end
    -- 鼠标按下消息
    if msg.type == 'mouse_down' then
        -- 鼠标左键按下
        if msg.code == 1 then
            return true
        end
        -- 鼠标右键按下
        if msg.code == 4 then
            return true
        end
    end
    -- 鼠标抬起消息
    if msg.type == 'mouse_up' then
        -- 鼠标左键抬起
        if msg.code == 2 then
            return true
        end
        -- 鼠标右键抬起
        if msg.code == 3 then
            return true
        end
    end
    return true
end
