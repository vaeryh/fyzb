<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.hcas:new('bas1')
	obj.Name='基地'
	obj.EditorSuffix='雄霸-主'
	obj.Tip='基地'
	obj.Ubertip='基地'
    obj.abilList='Bas1,Bas2,Bas3,Bas4,Pase,Ane2'
    obj.upgrades=''
    obj.Researches=''
    obj.Trains=''
	obj.modelScale='1.5'
    obj.scale='12'
	obj.race='human'
	obj.HP='500000'
	obj.regenHP='10'
    obj.regenType='always'
    obj.fmade='15'
table.insert(xG_unit_luaObj,obj)
?>
