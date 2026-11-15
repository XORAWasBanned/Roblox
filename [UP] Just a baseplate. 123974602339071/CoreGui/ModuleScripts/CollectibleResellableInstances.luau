-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.CollectibleResellableInstances
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetCollectibleResellableInstances)
local v_u_6 = require(v4.Models.CollectibleInstance)
return v2.createReducer({}, {
	[v5.name] = function(p7, p8)
		-- upvalues: (copy) v_u_6, (copy) v_u_3
		local v9 = p8.collectibleItemId
		local v10 = {}
		for _, v11 in p8.collectibleItemInstances do
			local v12 = v_u_6.fromGetCollectibleItemInstances(v11)
			v10[v12.collectibleInstanceId] = v12
		end
		return v_u_3.Dictionary.join(p7, {
			[v9] = v10
		})
	end
})