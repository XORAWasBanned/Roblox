-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.AssetBundles
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetAssetToBundlesMapping)
return v3.createReducer({}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_2
		local v8 = p7.assetId
		local v9 = {
			[tostring(v8)] = p7.bundleIds
		}
		return v_u_2.Dictionary.join(p6, v9)
	end
})