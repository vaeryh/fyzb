//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
<? xG_buff_luaObj={}
local slk = require 'slk'
obj=slk.buff.BNdo:new('BS02')
    obj.Name='龙威挑战'
    obj.Bufftip='龙威挑战'
    obj.Buffubertip='该单位处于龙威挑战状态。'
    obj.Buffart='ReplaceableTextures\\CommandButtons\\BTNBronzeDragon.blp'
table.insert(xG_buff_luaObj,obj)
obj=slk.buff.BOae:new('BS19')
    obj.Name='惊虹'
    obj.Bufftip='惊虹'
    obj.Buffubertip='该单位受到惊虹的加持，因此其移动速度和攻击速度都加快了。'
table.insert(xG_buff_luaObj,obj)
obj=slk.buff.BOae:new('BS20')
    obj.Name='大凶'
    obj.Bufftip='大凶'
    obj.Buffubertip='该单位受到大凶的加持，移动和攻击速度都加快了，但会受到额外伤害。'
    obj.Targetart='Abilities\\Spells\\Items\\AIsp\\SpeedTarget.mdl'
table.insert(xG_buff_luaObj,obj)
obj=slk.buff.BOae:new('BS24')
    obj.Name='神祭'
    obj.Bufftip='神祭'
    obj.Buffubertip='该单位受到神灵的祝福，短时间内不会死亡。'
table.insert(xG_buff_luaObj,obj)
?>
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ

//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
