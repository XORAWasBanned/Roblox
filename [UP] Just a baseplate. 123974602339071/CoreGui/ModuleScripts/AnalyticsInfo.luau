-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Reducer.AnalyticsInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.CloseOpenPrompt)
local v6 = require(v4.Actions.AddAnalyticsInfo)
return v2.createReducer({
	["addedAssets"] = nil,
	["removedAssets"] = nil
}, {
	[v6.name] = function(p7, p8)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p7, p8.info)
	end,
	[v5.name] = function(_, _)
		return {}
	end
})