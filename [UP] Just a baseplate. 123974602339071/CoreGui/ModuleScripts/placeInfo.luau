-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Reducers.placeInfo
local v1 = game:GetService("CorePackages")
require(v1.Packages.Cryo)
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetPlaceInfo)
return v2.createReducer({
	["name"] = "",
	["description"] = ""
}, {
	[v4.name] = function(_, p5)
		return {
			["name"] = p5.name,
			["description"] = p5.description
		}
	end
})