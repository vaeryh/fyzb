//DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
<? xG_ability_luaObj ={}
local slk = require 'slk'
obj = slk.ability.Asth:new('BjyD')
obj.EditorSuffix ='D圣灵决'
obj.Name ='步惊云'
obj.Requires =''
obj.Buttonpos1 ='1'
obj.Buttonpos2 ='1'
obj.Art ='ReplaceableTextures\\CommandButtons\\BTNDivineIntervention.blp'
obj.race ='human'
obj.Tip1 ='圣灵决'
obj.Ubertip1 ='每次攻击10%+等级* 0.3的几率无敌1秒（内置CD2秒）'
table.insert(xG_ability_luaObj, obj)
?>
//QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ
<? xG_ability_luaObj ={}
local slk = require 'slk'
obj = slk.ability.Awar:new('BjyQ')
obj.EditorSuffix ='Q排云掌'
obj.Name ='步惊云'
obj.Requires =''
obj.Researchhotkey ='Q'
obj.Buttonpos1 ='0'
obj.Buttonpos2 ='2'
obj.Researchbuttonpos1 ='0'
obj.Researchbuttonpos2 ='0'
obj.ResearchArt ='ReplaceableTextures\\PassiveButtons\\PASBTNSmash.blp'
obj.Animnames ='attack'
obj.hero ='1'
obj.race ='human'
obj.levels ='5'
obj.levelSkip ='10'
obj.targs1 ='ground, enemy, neutral'
obj.targs2 ='ground, enemy, neutral'
obj.targs3 ='ground, enemy, neutral'
obj.targs4 ='ground, enemy, neutral'
obj.targs5 ='ground, enemy, neutral'
obj.DataA1 ='50'
obj.DataA2 ='51'
obj.DataA3 ='52'
obj.DataA4 ='53'
obj.DataA5 ='54'
obj.DataC1 ='300'
obj.DataC2 ='300'
obj.DataC3 ='300'
obj.DataC4 ='300'
obj.DataC5 ='300'
obj.DataD1 ='400'
obj.DataD2 ='400'
obj.DataD3 ='400'
obj.DataD4 ='400'
obj.DataD5 ='400'
obj.Researchtip ='学习排云掌(|cffffcc00Q|r) - [|cffffcc00等级 %d|r]'
obj.Researchubertip ='攻击对目标300码范围造成60%的普攻伤害'
obj.Tip1 ='排云掌(|cffffcc00Q|r) - [|cffffcc00等级 1|r]'
obj.Tip2 ='排云掌(|cffffcc00Q|r) - [|cffffcc00等级 2|r]'
obj.Tip3 ='排云掌(|cffffcc00Q|r) - [|cffffcc00等级 3|r]'
obj.Tip4 ='排云掌(|cffffcc00Q|r) - [|cffffcc00等级 4|r]'
obj.Tip5 ='排云掌(|cffffcc00Q|r) - [|cffffcc00等级 5|r]'
obj.Ubertip1 ='攻击对目标300码范围造成60%的普攻伤害'
obj.Ubertip2 ='攻击对目标300码范围造成60%的普攻伤害'
obj.Ubertip3 ='攻击对目标300码范围造成60%的普攻伤害'
obj.Ubertip4 ='攻击对目标300码范围造成60%的普攻伤害'
obj.Ubertip5 ='攻击对目标300码范围造成60%的普攻伤害'
table.insert(xG_ability_luaObj, obj)
?>
//WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
<? xG_ability_luaObj ={}
local slk = require 'slk'
obj = slk.ability.ANcl:new('BjyW')
obj.EditorSuffix ='W霍家剑法'
obj.Name ='步惊云'
obj.Requires =''
obj.Hotkey ='W'
obj.Researchhotkey ='W'
obj.Buttonpos1 ='1'
obj.Buttonpos2 ='2'
obj.Researchbuttonpos1 ='1'
obj.Researchbuttonpos2 ='0'
obj.Art ='ReplaceableTextures\\CommandButtons\\BTNRavenForm.blp'
obj.ResearchArt ='ReplaceableTextures\\CommandButtons\\BTNRavenForm.blp'
obj.hero ='1'
obj.race ='human'
obj.levels ='5'
obj.levelSkip ='9'
obj.DataA1 ='0'
obj.DataB1 ='1'
obj.DataC1 ='1'
obj.DataE1 ='0'
obj.DataF1 ='ambush'
obj.Researchtip ='学习霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 %d|r]'
obj.Researchubertip ='在2秒内对敌方单个单位攻击9次'
obj.Tip1 ='霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 1|r]'
obj.Tip2 ='霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 2|r]'
obj.Tip3 ='霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 3|r]'
obj.Tip4 ='霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 4|r]'
obj.Tip5 ='霍家剑法(|cffffcc00W|r) - [|cffffcc00等级 5|r]'
obj.Ubertip1 ='在2秒内对敌方单个单位攻击9次'
obj.Ubertip2 ='在2秒内对敌方单个单位攻击9次'
obj.Ubertip3 ='在2秒内对敌方单个单位攻击9次'
obj.Ubertip4 ='在2秒内对敌方单个单位攻击9次'
obj.Ubertip5 ='在2秒内对敌方单个单位攻击9次'
table.insert(xG_ability_luaObj, obj)
?>
//EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
<? xG_ability_luaObj ={}
local slk = require 'slk'
obj = slk.ability.Asth:new('BjyE')
obj.EditorSuffix ='E不哭死神'
obj.Name ='步惊云'
obj.Requires =''
obj.Hotkey ='E'
obj.Researchhotkey ='E'
obj.Buttonpos1 ='2'
obj.Buttonpos2 ='2'
obj.Researchbuttonpos1 ='2'
obj.Researchbuttonpos2 ='0'
obj.Art ='ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp'
obj.ResearchArt ='ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp'
obj.hero ='1'
obj.race ='human'
obj.levels ='5'
obj.levelSkip ='10'
obj.Researchtip ='学习不哭死神(|cffffcc00E|r) - [|cffffcc00等级 %d|r]'
obj.Researchubertip ='减少周围敌军30%的攻击力和护甲'
obj.Tip1 ='不哭死神 - [|cffffcc00等级 1|r]'
obj.Tip2 ='不哭死神 - [|cffffcc00等级 2|r]'
obj.Tip3 ='不哭死神 - [|cffffcc00等级 3|r]'
obj.Tip4 ='不哭死神 - [|cffffcc00等级 4|r]'
obj.Tip5 ='不哭死神 - [|cffffcc00等级 5|r]'
obj.Ubertip1 ='减少周围敌军30%的攻击力和护甲'
obj.Ubertip2 ='减少周围敌军30%的攻击力和护甲'
obj.Ubertip3 ='减少周围敌军30%的攻击力和护甲'
obj.Ubertip4 ='减少周围敌军30%的攻击力和护甲'
obj.Ubertip5 ='减少周围敌军30%的攻击力和护甲'
table.insert(xG_ability_luaObj, obj)
obj = slk.ability.ACav:new('BjE0')
obj.Name ='步惊云'
obj.EditorSuffix ='E专注'
obj.race ='human'
obj.Buttonpos1 ='0'
obj.Buttonpos2 ='-11'
obj.levels ='5'
obj.TargetArt ='Abilities\\Spells\\Undead\\RegenerationAura\\ObsidianRegenAura.mdl'
for i = 1, 5 do
obj['BuffID'..i]='BjE2'
obj['DataA'..i]=-0.1 * i
obj['DataB'..i]='1'
obj['Area'..i]= 100 + i * 100
obj['targs'..i]='enemies, ground, vulnerable, air, neutral'
end
table.insert(xG_ability_luaObj, obj)
obj = slk.ability.ACat:new('BjE1')
obj.Name ='步惊云'
obj.EditorSuffix ='E强击'
obj.race ='human'
obj.Buttonpos1 ='0'
obj.Buttonpos2 ='-11'
obj.TargetArt ='.mdl'
obj.levels ='5'
for i = 1, 5 do
obj['BuffID'..i]='BjE3'
obj['DataA'..i]=-0.1 * i
obj['DataB'..i]='1'
obj['DataC'..i]='1'
obj['Area'..i]= 100 + i * 100
obj['targs'..i]='enemies, ground, vulnerable, air, neutral'
end
table.insert(xG_ability_luaObj, obj)
?>
//RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
<? xG_ability_luaObj ={}
local slk = require 'slk'
obj = slk.ability.Asth:new('BjyR')
obj.EditorSuffix ='R麒麟臂'
obj.Name ='步惊云'
obj.Requires =''
obj.Researchhotkey ='E'
obj.Buttonpos1 ='3'
obj.Buttonpos2 ='2'
obj.Researchbuttonpos1 ='3'
obj.Researchbuttonpos2 ='0'
obj.Art ='ReplaceableTextures\\PassiveButtons\\PASBTNImmolation.blp'
obj.ResearchArt ='ReplaceableTextures\\PassiveButtons\\PASBTNImmolation.blp'
obj.hero ='1'
obj.race ='human'
obj.levels ='3'
obj.reqLevel ='30'
obj.levelSkip ='30'
obj.Researchtip ='学习麒麟臂(|cffffcc00R|r) - [|cffffcc00等级 %d|r]'
obj.Researchubertip ='增加300点力量，攻击附带力量* 1.5的额外伤害，'
obj.Tip1 ='麒麟臂(|cffffcc00R|r) - [|cffffcc00等级 1|r]'
obj.Tip2 ='麒麟臂(|cffffcc00R|r) - [|cffffcc00等级 2|r]'
obj.Tip3 ='麒麟臂(|cffffcc00R|r) - [|cffffcc00等级 3|r]'
obj.Ubertip1 ='增加300点力量，攻击附带力量* 1.5的额外伤害，'
obj.Ubertip2 ='增加300点力量，攻击附带力量* 1.5的额外伤害，'
obj.Ubertip3 ='增加300点力量，攻击附带力量* 1.5的额外伤害，'
table.insert(xG_ability_luaObj, obj)
?>
