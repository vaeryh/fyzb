<? xG_ability_luaObj={}
local slk = require 'slk'
obj=slk.ability.ANcl:new('Bas1')
    obj.Name='雄霸'
    obj.EditorSuffix='金换木'
    obj.Buttonpos1='0'
    obj.Buttonpos2='2'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='fanofknives'
    obj.Tip='金币换木头'    
    obj.Ubertip='金币：木头=100:1'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.levels='1'    
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('Bas2')
    obj.Name='雄霸'
    obj.EditorSuffix='木换金'
    obj.Buttonpos1='1'
    obj.Buttonpos2='2'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='coupletarget'
    obj.Tip='木头换金币'    
    obj.Ubertip='木头：金币=1:10000'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.levels='1'    
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('Bas3')
    obj.Name='雄霸'
    obj.EditorSuffix='升级'
    obj.Buttonpos1='2'
    obj.Buttonpos2='2'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='coupletarget'
    obj.Tip='升级'    
    obj.Ubertip='升级'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.levels='1'    
table.insert(xG_ability_luaObj,obj)
obj=slk.ability.ANcl:new('Bas4')
    obj.Name='雄霸'
    obj.EditorSuffix='无敌'
    obj.Buttonpos1='3'
    obj.Buttonpos2='2'
    obj.DataA1='0'
    obj.DataC1='1'
    obj.DataE1='0'
    obj.DataF1='coupletarget'
    obj.Tip='无敌'    
    obj.Ubertip='雄霸无敌30秒'
    obj.Animnames=''
    obj.CasterArt=''
    obj.hero='0'
    obj.levels='1'
    obj.Cool1='60'
table.insert(xG_ability_luaObj,obj)
?>
