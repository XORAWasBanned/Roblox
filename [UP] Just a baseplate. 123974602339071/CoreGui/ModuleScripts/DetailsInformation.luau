-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.DetailsInformation
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetDetailsInformation)
return v2.createReducer({
	["viewingDetails"] = false,
	["assetId"] = nil
}, {
	[v4.name] = function(_, p5)
		return {
			["viewingDetails"] = p5.viewingDetails,
			["assetId"] = p5.assetId
		}
	end
})