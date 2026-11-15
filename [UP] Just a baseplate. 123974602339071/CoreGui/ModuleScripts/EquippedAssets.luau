-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.EquippedAssets
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.SetEquippedAssets)
return v2.createReducer({}, {
	[v4.name] = function(_, p5)
		local v6 = {}
		for _, v7 in ipairs(p5.equippedAssets) do
			local v8 = v7.assetId
			v6[tostring(v8)] = true
		end
		return v6
	end
})