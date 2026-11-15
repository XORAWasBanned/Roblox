-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.StoreId
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
local v4 = require(v3.Actions.UpdateStoreId)
local v_u_5 = 0
return v2.createReducer("0", {
	[v4.name] = function(_, _)
		-- upvalues: (ref) v_u_5
		v_u_5 = v_u_5 + 1
		local v6 = v_u_5
		return tostring(v6)
	end
})