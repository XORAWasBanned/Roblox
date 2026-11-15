-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Localization.LocalizationContext
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2) -- name: new
	-- upvalues: (copy) v_u_1
	local v3 = {
		["_translations"] = p2
	}
	local v4 = v_u_1
	setmetatable(v3, v4)
	return v3
end
function v_u_1.addTranslations(p5, p6) -- name: addTranslations
	p5._translations = p6
end
function v_u_1.getRelevantLanguages(p7) -- name: getRelevantLanguages
	local v8 = {}
	table.insert(v8, p7)
	local v9 = p7:match("^(%w+)[-_]")
	if v9 then
		table.insert(v8, v9)
	end
	table.insert(v8, "en-us")
	return v8
end
function v_u_1._getSourceString(p10, p11, p12) -- name: _getSourceString
	local v13 = p10._translations[p11]
	if v13 then
		return v13[p12]
	else
		return nil
	end
end
function v_u_1.getString(p14, p15, p16, p17) -- name: getString
	local v18 = p14:_getSourceString(p15, p16)
	local v19 = p15:match("^(%w+)[-_]")
	local v20
	if v19 then
		v20 = p14:_getSourceString(v19, p16)
	else
		v20 = nil
	end
	local v21 = v18 or (v20 or p14:_getSourceString("en-us", p16))
	if not v21 then
		local v22 = ("Couldn\'t find value for translation key %q!\nTried these languages: %s, %s, %s"):format(p16, p15, v19, "en-us")
		error(v22, 2)
	end
	if p17 then
		return v21:gsub("{(.-)}", p17)
	else
		return v21
	end
end
return v_u_1