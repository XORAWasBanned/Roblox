-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.TryingOnInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetTryingOnInfo)
return v2.createReducer({
	["tryingOn"] = false,
	["assetId"] = nil,
	["assetTypeId"] = nil
}, {
	[v4.name] = function(_, p5)
		return {
			["tryingOn"] = p5.tryingOn,
			["assetId"] = p5.assetId,
			["assetTypeId"] = p5.assetTypeId
		}
	end
})