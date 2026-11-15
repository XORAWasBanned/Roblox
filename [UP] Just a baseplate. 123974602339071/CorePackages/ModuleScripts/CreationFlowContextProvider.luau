-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Context.CreationFlowContextProvider
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Context.CreationFlowContext)
return function(p6) -- name: CreationFlowContextProvider
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	local v7 = v_u_4.createElement
	local v8 = v_u_5.Provider
	local v9 = {
		["value"] = v_u_3.join(p6.value, {
			["captures"] = p6.captures,
			["exitCreationFlow"] = p6.exitCreationFlow
		})
	}
	return v7(v8, v9, p6.children)
end