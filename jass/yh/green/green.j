//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
scope Attack initializer Init
globals
	public integer array Id
endglobals

private function xG_ability_lua takes nothing returns nothing
	<? xG_ability_luaObj ={}
	local slk = require 'slk'
	local k = 2
	for i = 0, 23 do
	local name = string.format("Attack".."[%07d]", k^i)
	obj = slk.ability.AItg:new(name)
	obj.EditorSuffix =''
	obj.Name = name
	obj.DataA1 = k^i
	table.insert(xG_ability_luaObj, obj)
	end
	?>
endfunction

private function Init takes nothing returns nothing
	<? for i = 1,#xG_ability_luaObj do?>
	set Id[<?=i?>] = '<?=xG_ability_luaObj[i].get_id()?>'
	<?end?>
endfunction

endscope
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
scope Armor initializer Init

globals
	public integer array Id
endglobals

private function xG_ability_lua takes nothing returns nothing
	<? xG_ability_luaObj ={}
	local slk = require 'slk'
	local k = 2
	for i = 0, 23 do
	local name = string.format("Armor".."[%07d]", k^i)
	obj = slk.ability.AId7:new(name)
	obj.EditorSuffix =''
	obj.Name = name
	obj.DataA1 = k^i
	table.insert(xG_ability_luaObj, obj)
	end
	?>
endfunction

private function Init takes nothing returns nothing
	<? for i = 1,#xG_ability_luaObj do?>
	set Id[<?=i?>] = '<?=xG_ability_luaObj[i].get_id()?>'
	<?end?>
endfunction

endscope
//↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑Function↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

//↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓Function↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
scope StrAgiInt initializer Init
globals
	public integer array Id
endglobals

private function xG_ability_lua takes nothing returns nothing
	<? xG_ability_luaObj ={}
	local slk = require 'slk'
	local k = 2
	local name
	--力量
	for i = 0, 29 do
	name = string.format("Str".."[%09d]", k^i)
	obj = slk.ability.AIx3:new(name)
	obj.Name = name
	obj.DataA1 ='0'
	obj.DataB1 ='0'
	obj.DataC1 = k^i
	obj.DataD1 ='1'
	table.insert(xG_ability_luaObj, obj)
	end
	--敏捷
	for i = 0, 29 do
	name = string.format("Agi".."[%09d]", k^i)
	obj = slk.ability.AIx3:new(name)
	obj.Name = name
	obj.DataA1 = k^i
	obj.DataB1 ='0'
	obj.DataC1 ='0'
	obj.DataD1 ='1'
	table.insert(xG_ability_luaObj, obj)
	end
	--智力
	for i = 0, 29 do
	name = string.format("Int".."[%09d]", k^i)
	obj = slk.ability.AIx3:new(name)
	obj.Name = name
	obj.DataA1 ='0'
	obj.DataB1 = k^i
	obj.DataC1 ='0'
	obj.DataD1 ='1'
	table.insert(xG_ability_luaObj, obj)
	end
	?>
endfunction

private function Init takes nothing returns nothing
	<? for i = 1,#xG_ability_luaObj do?>
	set Id[<?=i?>] = '<?=xG_ability_luaObj[i].get_id()?>'
	<?end?>
endfunction

endscope
