-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.IsLoaded
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetAssets)
return v2.createReducer(false, {
	[v4.name] = function(_, _)
		return true
	end
})