-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useToggleState
local v1 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_2 = require(v1.React)
return function(p3) -- name: useToggleState
	-- upvalues: (copy) v_u_2
	local v4, v_u_5 = v_u_2.useState(p3 or false)
	return {
		["enabled"] = v4,
		["enable"] = v_u_2.useCallback(function()
			-- upvalues: (copy) v_u_5
			v_u_5(true)
		end, {}),
		["disable"] = v_u_2.useCallback(function()
			-- upvalues: (copy) v_u_5
			v_u_5(false)
		end, {}),
		["toggle"] = v_u_2.useCallback(function()
			-- upvalues: (copy) v_u_5
			v_u_5(function(p6)
				return not p6
			end)
		end, {}),
		["set"] = v_u_5
	}
end