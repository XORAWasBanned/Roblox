-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.createStyleSheetRules
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation")
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v1.StyleRule)
require(v1.Rules.Types)
require(v2.Enums.ColorMode)
require(v2.Enums.Device)
local v_u_6 = require(v2.Utility.Flags)
require(v1.getOverrideAttributes)
local v_u_7 = require(v2.Utility.scaleValue)
local function v_u_18(p8, p9, p10) -- name: insertRule
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v11 = p9.properties
	local v12 = "." .. p10
	local v13 = p9.modifier == nil and "" or ":" .. p9.modifier
	local v14 = v12 .. v13 .. (p9.pseudo == nil and "" or " ::" .. p9.pseudo)
	if p9.pseudoName ~= nil then
		v14 = v14 .. " #" .. p9.pseudoName
	end
	if p9.pseudo ~= nil and p9.pseudoName == nil then
		v14 = v14 .. ", " .. v12 .. v13 .. " > " .. p9.pseudo
	end
	local v15 = v_u_4.createElement
	local v16 = v_u_5
	local v17 = {
		["key"] = v14,
		["Priority"] = p9.priority,
		["Selector"] = v14,
		["properties"] = v11
	}
	table.insert(p8, v15(v16, v17))
end
local function v_u_28(p19, p20, p21, p22, p23) -- name: updateRuleAttributes
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	local v24 = v_u_6.FoundationDisableTokenScaling and 1 or (p22 or 1)
	for _, v25 in p20 or {} do
		local v26
		if p23 then
			v26 = p23[v25.name]
		else
			v26 = nil
		end
		if v26 == nil then
			v26 = v25.value
		end
		local v27 = v_u_7(v26, v24)
		if p21[v25.name] == v27 then
			continue
		end
		p19:SetAttribute(v25.name, v27)
		p21[v25.name] = v27
	end
end
return function(p29, p30, p31, p32, p33, p34) -- name: createStyleSheetRules
	-- upvalues: (copy) v_u_28, (copy) v_u_18
	local v35 = {}
	for v36, _ in p30 do
		local v37 = p29[v36]
		if v37 == nil then
			continue
		end
		if p31 and p32 then
			v_u_28(p31, v37.attributes, p32, p33, p34)
		end
		v_u_18(v35, v37, v36)
		if not v37.children then
			continue
		end
		for _, v38 in v37.children do
			if p31 and p32 then
				v_u_28(p31, v38.attributes, p32, p33, p34)
			end
			v_u_18(v35, v38, v38.tag)
		end
	end
	return v35
end