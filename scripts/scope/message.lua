local message = require 'jass.message'

if not message then
    return
end
local keyboard = message.keyboard

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
    --printF(msg.type, msg.code, msg.state)
    -- 键盘抬起消息
    if msg.type == 'key_up' then
        if msg.code == keyboard['F2'] then

            return true
        end
        -- 重载ESC
        if msg.code == 512 then
            local help = require 'test.help'
            help.reload()
            return true
        end
    end
    -- 键盘按下消息
    if msg.type == 'key_down' then
        if msg.code == keyboard['F3'] then

            return true
        end
        if msg.code == keyboard['Z'] then
            gU.setXY(selection, message.mouse())
            log.trace(message.mouse())
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
