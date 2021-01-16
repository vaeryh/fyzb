
<? xG_unit_luaObj={}
local slk = require 'slk'
obj=slk.unit.Hmbr:new('zz01') 
	obj.abilList='Aneu,Avul,AInv,Zz00,Zz01,Zz02'
	--obj.Sellitems='CQ13,CQ14,ZS14,ZS15,CG12,CG13'
	obj.Name='神匠'
    obj.weapsOn='0'
	--obj.modelScale='1.5'
	--obj.file='LNwu111.mdl'
    --obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ngme:new('zz02') 
	obj.Name='材料一'
    obj.Sellitems='qh01,qh02,qh03,qh04,qh05,qh06,qh07'
	--obj.modelScale='1.5'
	--obj.file='LNwu111.mdl'
    obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
obj=slk.unit.ngme:new('zz03') 
	obj.Name='材料二'
    obj.Sellitems='qh08,qh09,qh10,qh11,qh12,qh13,qh14'
	--obj.modelScale='1.5'
	--obj.file='LNwu111.mdl'
    obj.uberSplat=''
table.insert(xG_unit_luaObj,obj)
?>
