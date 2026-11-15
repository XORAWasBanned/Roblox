-- Path: CoreGui.RobloxGui.Modules.PlayerList.Reducers.Settings
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent.Actions
local v4 = require(v3.SetSettings)
return v2.createReducer({
	["preferredTransparency"] = 1,
	["reducedMotion"] = false
}, {
	[v4.name] = function(_, p5)
		return {
			["preferredTransparency"] = p5.preferredTransparency,
			["reducedMotion"] = p5.reducedMotion
		}
	end
})