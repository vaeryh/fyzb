<? xG_buff_luaObj ={}
local slk = require 'slk'
obj = slk.buff.BHad:new('SyEb')
obj.EditorSuffix ='守卫'
obj.EditorName ='神医'
obj.Bufftip ='药王神经-培育'
obj.Buffubertip ='神医培育的专属范围内的敌人/友军受到此时附魔的圣物/毒物的效果。'
table.insert(xG_buff_luaObj, obj)
obj = slk.buff.BOae:new('B091')
obj.EditorSuffix ='天羽灵香'
obj.EditorName ='神医'
obj.Bufftip ='天羽灵香'
obj.Buffubertip ='该单位处在天羽灵香光环的作用之下，因此其移动速度和攻击速度都加快了。'
table.insert(xG_buff_luaObj, obj)
obj = slk.buff.Broa:new('B100')
obj.EditorSuffix ='莽牯朱蛤'
obj.EditorName ='神医'
obj.Bufftip ='莽牯朱蛤'
obj.Buffubertip ='该单位处在莽牯朱蛤光环的作用之下，因此其攻击力和护甲值都得到了削弱。'
obj.Buffart ='ReplaceableTextures\\CommandButtons\\BTNFaerieFire.blp'
obj.TargetArt ='Abilities\\Spells\\NightElf\\FaerieFire\\FaerieFireTarget.mdl'
table.insert(xG_buff_luaObj, obj)
obj = slk.buff.Broa:new('B101')
obj.EditorSuffix ='七星海棠'
obj.EditorName ='神医'
obj.Bufftip ='七星海棠'
obj.Buffubertip ='该单位处在七星海棠光环的作用之下，因此其攻击力和护甲值都得到了加强。'
table.insert(xG_buff_luaObj, obj)
?>
