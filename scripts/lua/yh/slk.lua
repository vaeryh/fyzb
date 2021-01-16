local message = require 'jass.message'
local slk = require 'jass.slk'

if not message then
    return
end
local keyboard = message.keyboard

local function func()
    print(slk)
    print(slk.item)
    print(slk.unit)
    print(slk.ability)
    print(slk.item.penr)
    print(slk.unit.hpea)
    print(slk.ability.Avul)
    print(slk.item.tfar.Name)
    for k, v in pairs(slk.ability.Avul) do
        print(k)
    end
end


