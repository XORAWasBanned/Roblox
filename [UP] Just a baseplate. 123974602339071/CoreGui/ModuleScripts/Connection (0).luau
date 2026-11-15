-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Connection
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v_u_5 = require(script.FriendStatusConnector)
local v_u_6 = require(script.LastInputTypeConnector)
local v_u_7 = require(script.MouseOverrideManager)
local v_u_8 = require(script.FocusHighlightManager)
local v_u_9 = require(script.NativeCloseEventConnector)
local v10 = script.Parent.Parent
local v11 = require(v10.InGameMenuPolicy)
local v_u_12 = v4.strictInterface({
	["isEducationalPopupEnabled"] = v4.optional(v4.boolean)
})
return v11.connect(function(p13, _)
	return {
		["isEducationalPopupEnabled"] = p13.enableEducationalPopup()
	}
end)(function(p14) -- name: Connection
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	local v15 = v_u_12
	assert(v15)
	return v_u_3.createFragment({
		["FriendStatusConnector"] = v_u_3.createElement(v_u_5),
		["LastInputTypeConnector"] = v_u_3.createElement(v_u_6),
		["MouseOverrideManager"] = v_u_3.createElement(v_u_7),
		["FocusHighlightManager"] = v_u_3.createElement(v_u_8),
		["NativeCloseEventConnector"] = p14.isEducationalPopupEnabled and v_u_3.createElement(v_u_9) or nil
	})
end)