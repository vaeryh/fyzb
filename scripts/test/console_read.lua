local console = require 'jass.console'

console.write('测试开始...')

-- 开启计时器,每0.1秒检查输入
TimerStart(CreateTimer(), 0.1, true, function()

    -- 检查CMD窗口中的用户输入,如果用户有提交了的输入,则回调函数(按回车键提交输入).否则不做任何动作
    console.read(function(str)
        -- 参数即为用户的输入.需要注意的是这个函数调用是不同步的(毕竟其他玩家不知道你输入了什么)
        console_read = str
    end)
end)

