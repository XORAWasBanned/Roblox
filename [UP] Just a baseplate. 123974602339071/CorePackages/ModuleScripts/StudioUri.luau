-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Plugin.StudioUri
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.Dash).join
local v_u_3 = {}
local v_u_7 = {
	["equals"] = function(p4, p5) -- name: equals
		if rawequal(p4, p5) then
			return true
		end
		local v6
		if p4.DataModel == p5.DataModel and (p4.PluginType == p5.PluginType and (p4.PluginId == p5.PluginId and p4.Category == p5.Category)) then
			v6 = p4.ItemId == p5.ItemId
		else
			v6 = false
		end
		return v6
	end
}
v_u_7.RESTRICTED_Mt = table.freeze({
	["__eq"] = function(p8, p9) -- name: __eq
		-- upvalues: (copy) v_u_7
		return v_u_7.equals(p8, p9)
	end
})
function v_u_7.wrap(p10) -- name: wrap
	-- upvalues: (copy) v_u_7
	if table.isfrozen(p10) and getmetatable(p10) == v_u_7.RESTRICTED_Mt then
		return p10
	end
	if table.isfrozen(p10) then
		p10 = table.clone(p10)
	end
	local v11 = table.freeze
	local v12 = v_u_7.RESTRICTED_Mt
	return v11((setmetatable(p10, v12)))
end
function v_u_7.join(p13, p14) -- name: join
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	return v_u_7.wrap(v_u_2(p13, p14))
end
function v_u_7.toString(p15) -- name: toString
	-- upvalues: (copy) v_u_3
	local v16 = table.create(5)
	local v17 = p15 or v_u_3
	if not v17 then
		return ""
	end
	if v17.DataModel then
		local v18 = ("DataModel:%*"):format(v17.DataModel)
		table.insert(v16, v18)
	end
	if v17.PluginType then
		local v19 = ("PluginType:%*"):format(v17.PluginType)
		table.insert(v16, v19)
	end
	if v17.PluginId then
		local v20 = ("PluginId:%*"):format(v17.PluginId)
		table.insert(v16, v20)
	end
	if v17.Category then
		local v21 = ("Category:%*"):format(v17.Category)
		table.insert(v16, v21)
	end
	if v17.ItemId then
		local v22 = ("ItemId:%*"):format(v17.ItemId)
		table.insert(v16, v22)
	end
	return table.concat(v16, ", ")
end
function v_u_7.child(p23, p24) -- name: child
	-- upvalues: (copy) v_u_7
	local v25 = v_u_7.join
	local v26 = {}
	if p23.ItemId then
		p24 = ("%*/%*"):format(p23.ItemId, p24)
	end
	v26.ItemId = p24
	return v25(p23, v26)
end
function v_u_7.isNull(p27) -- name: isNull
	return p27.DataModel == "Null"
end
function v_u_7.isValid(p28) -- name: isValid
	return type(p28) == "table"
end
function v_u_7.isStudioUri(p29) -- name: isStudioUri
	if type(p29) == "table" then
		return (p29.DataModel ~= nil or (p29.PluginType ~= nil or (p29.PluginId ~= nil or p29.Category ~= nil))) and true or p29.ItemId ~= nil
	else
		return false
	end
end
function v_u_7.fromAction(p30, p31) -- name: fromAction
	-- upvalues: (copy) v_u_7
	return v_u_7.wrap({
		["DataModel"] = "Standalone",
		["PluginId"] = nil,
		["Category"] = "Actions",
		["ItemId"] = nil,
		["PluginId"] = p30,
		["ItemId"] = p31
	})
end
function v_u_7.fromSetting(p32, p33) -- name: fromSetting
	-- upvalues: (copy) v_u_7
	return v_u_7.wrap({
		["DataModel"] = "Standalone",
		["PluginId"] = nil,
		["Category"] = "Settings",
		["ItemId"] = nil,
		["PluginId"] = p32,
		["ItemId"] = p33
	})
end
function v_u_7.fromWidget(p34, p35) -- name: fromWidget
	-- upvalues: (copy) v_u_7
	return v_u_7.wrap({
		["DataModel"] = "Standalone",
		["PluginId"] = nil,
		["Category"] = "Widgets",
		["ItemId"] = nil,
		["PluginId"] = p34,
		["ItemId"] = p35
	})
end
function v_u_7.fromPanel(p36, p37) -- name: fromPanel
	-- upvalues: (copy) v_u_7
	return v_u_7.wrap({
		["DataModel"] = "Standalone",
		["PluginId"] = nil,
		["Category"] = "Panels",
		["ItemId"] = nil,
		["PluginId"] = p36,
		["ItemId"] = p37
	})
end
return v_u_7