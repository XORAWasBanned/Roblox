-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.StyleSheetRegistry
local v1 = script.Parent.Parent
require(v1.Enums.ColorMode)
local v_u_2 = require(v1.Enums.Device)
local v_u_3 = require(v1.Enums.ThemeName)
require(v1.Providers.Style.Tokens)
require(script.Parent.Rules.Types)
local v_u_4 = require(v1.Utility.Flags)
local v5 = require(v1.Utility.devAssert)
local v_u_6 = require(v1.Utility.getGeneratedRules)
local v7 = require(v1.Utility.getMainGui)
local v_u_8 = require(script.Parent.getOverrideAttributes)
local v_u_9 = require(v1.Utility.scaleValue)
local v10 = game:GetService("HttpService")
local v_u_11 = Instance.new("Folder")
v_u_11.Name = "FoundationStyleSheets" .. v10:GenerateGUID(false)
local v12 = v7()
v5(v12 ~= nil, "MainGui not found")
v_u_11.Parent = v12
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = false
local function v_u_27(p16, p17, p18, p19, p20) -- name: createStyleSheet
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_11, (copy) v_u_8, (copy) v_u_6
	local v21 = p17 or v_u_2.Desktop
	local v22 = p18 or 1
	local v23 = p20 or v_u_3.Default
	local v24 = Instance.new("StyleSheet")
	local v25 = ("%*-"):format(v23)
	local v26
	if p19 == nil then
		v26 = ("%*%*-%*-%*"):format(v25, p16, v21, v22)
	else
		v26 = ("%*%*-%*-%*-%*"):format(v25, p16, v21, v22, (tostring(p19)))
	end
	v24.Name = v26
	v24.Parent = v_u_11
	return {
		["themeName"] = nil,
		["colorMode"] = nil,
		["device"] = nil,
		["scale"] = nil,
		["tokenOverrides"] = nil,
		["overrideAttributes"] = nil,
		["instance"] = nil,
		["tags"] = nil,
		["rules"] = nil,
		["attributes"] = nil,
		["refCount"] = 0,
		["themeName"] = v23,
		["colorMode"] = p16,
		["device"] = v21,
		["scale"] = v22,
		["tokenOverrides"] = p19,
		["overrideAttributes"] = v_u_8(v23, p16, v21, p19),
		["instance"] = v24,
		["tags"] = {},
		["rules"] = v_u_6(v23, p16, v21),
		["attributes"] = {}
	}
end
local function v_u_34(p28, p29) -- name: createStyleRule
	local v30 = "." .. p29
	local v31 = p28.modifier == nil and "" or ":" .. p28.modifier
	local v32 = v30 .. v31 .. (p28.pseudo == nil and "" or " ::" .. p28.pseudo)
	if p28.pseudoName ~= nil then
		v32 = v32 .. " #" .. p28.pseudoName
	end
	if p28.pseudo ~= nil and p28.pseudoName == nil then
		v32 = v32 .. ", " .. v30 .. v31 .. " > " .. p28.pseudo
	end
	local v33 = Instance.new("StyleRule")
	v33.Name = v32
	v33.Priority = p28.priority or 1
	v33.Selector = v32
	v33:SetProperties(p28.properties)
	return v33
end
local function v_u_39(p35, p36) -- name: applyAttributes
	-- upvalues: (copy) v_u_4, (copy) v_u_9
	if p36 then
		for _, v37 in p36 do
			if p35.attributes[v37.name] then
				continue
			end
			local v38 = p35.overrideAttributes[v37.name]
			if v38 == nil then
				v38 = v37.value
			end
			if not v_u_4.FoundationDisableTokenScaling then
				v38 = v_u_9(v38, p35.scale)
			end
			p35.attributes[v37.name] = true
			p35.instance:SetAttribute(v37.name, v38)
		end
	end
end
local function v_u_45(p40, p41) -- name: addRegisteredStyleSheetTags
	-- upvalues: (copy) v_u_34, (copy) v_u_39
	for _, v42 in p41 do
		if p40.tags[v42] then
			continue
		end
		local v43 = p40.rules[v42]
		if not v43 then
			continue
		end
		v_u_34(v43, v42).Parent = p40.instance
		v_u_39(p40, v43.attributes)
		if v43.children then
			for _, v44 in v43.children do
				v_u_34(v44, v44.tag).Parent = p40.instance
				v_u_39(p40, v44.attributes)
			end
		end
		p40.tags[v42] = true
	end
end
local function v_u_57(p46, p47, p48, p49, p50) -- name: resolveStyleSheet
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_13, (copy) v_u_14, (copy) v_u_27
	local v51 = p47 or v_u_2.Desktop
	local v52 = p50 or v_u_3.Default
	local v53 = p48 or 1
	for v54, v55 in v_u_13 do
		if v55.themeName ~= v52 or (v55.colorMode ~= p46 or (v55.device ~= v51 or (v55.scale ~= v53 or v55.tokenOverrides ~= p49))) then
			continue
		end
		v_u_14[v54] = nil
		return v54
	end
	local v56 = v_u_27(p46, v51, v53, p49, v52)
	v_u_13[v56.instance] = v56
	return v56.instance
end
local function v_u_60() -- name: flushPendingCleanup
	-- upvalues: (ref) v_u_15, (copy) v_u_14, (copy) v_u_13
	v_u_15 = false
	for v58 in v_u_14 do
		v_u_14[v58] = nil
		local v59 = v_u_13[v58]
		if v59 == nil then
			continue
		end
		if v59.refCount > 0 then
			continue
		end
		v_u_13[v58] = nil
		v58:Destroy()
	end
end
return {
	["resolveStyleSheet"] = v_u_57,
	["getStyleSheet"] = function(p61, p62, p63, p64, p65) -- name: getStyleSheet
		-- upvalues: (copy) v_u_57, (copy) v_u_13, (copy) v_u_14
		local v66 = v_u_57(p61, p62, p63, p64, p65)
		local v67 = v_u_13[v66]
		if v67 == nil then
			return v66
		end
		v67.refCount = v67.refCount + 1
		v_u_14[v66] = nil
		return v66
	end,
	["addStyleTags"] = function(p68, p69) -- name: addStyleTags
		-- upvalues: (copy) v_u_13, (copy) v_u_45
		local v70 = v_u_13[p68]
		if not v70 then
			error("StyleSheet not found in registry")
		end
		v_u_45(v70, p69)
	end,
	["acquireStyleSheet"] = function(p71) -- name: acquireStyleSheet
		-- upvalues: (copy) v_u_13, (copy) v_u_14
		local v72 = v_u_13[p71]
		if v72 ~= nil then
			v72.refCount = v72.refCount + 1
			v_u_14[p71] = nil
		end
	end,
	["releaseStyleSheet"] = function(p73) -- name: releaseStyleSheet
		-- upvalues: (copy) v_u_13, (copy) v_u_14, (ref) v_u_15, (copy) v_u_60
		local v74 = v_u_13[p73]
		if v74 ~= nil and v74.refCount ~= 0 then
			v74.refCount = v74.refCount - 1
			if v74.refCount == 0 then
				v_u_14[p73] = true
				if v_u_15 then
					return
				end
				v_u_15 = true
				task.delay(5, v_u_60)
			end
		end
	end,
	["flushPendingCleanup"] = v_u_60
}