-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Reducers.installReducer
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Rodux)
local v_u_4 = require(v1.Reducers.CreationFlow)
local v_u_5 = require(v1.Reducers.Music)
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v6 = {
		["CreationFlow"] = v_u_4,
		["Music"] = v_u_5
	}
	return v_u_3.combineReducers(v6)
end